function output = find_waves_and_stimulate(fs, sampled_time, sampled_data, seizures, stim_param, d_wave_timestamps, p_wave_timestamps)
	% timers = timerfind('Running', 'on');

	% get last epoch value
	% see if last data is a seizure
	% compute position of waves in the last epoch
	% predict position of the wave in the current epoch
	% see if those position have been stimulated (get all timers)
	% if not, plan a trigger.

	% input:
	% sampled_data and sampled_time up to date
	% Master8 object to launch stimulation
	% stim_params
	% d_wave_timestamps (from previous computations)

	% output:
	% d_wave_timestamps (updated with data from last epoch)
    
    global Master8;
    
	index_last_epoch = size(sampled_time, 1);

	signal = sampled_data(index_last_epoch, :);
	time = sampled_time(index_last_epoch, :);

	o = get_wave_positions_epoch(signal, time, fs);

	% for each predicted wave, create Timer
	for i=1:numel(o.p_wave_timestamps)
        disp(strcat('epoch :', num2str(index_last_epoch), ' p wave timestamps:', num2str(o.p_wave_timestamps(1,i))));
		createStimulationTimer(o.p_wave_timestamps(1,i));
		p_wave_timestamps = [p_wave_timestamps o.p_wave_timestamps(1,i)];
	end

	% for each detected wave, add it to the detected wave timestamps
	for i=1:numel(o.d_wave_timestamps)
		d_waves_timestamps = [d_wave_timestamps o.d_wave_timestamps(1,i)];
	end

	output.d_wave_timestamps = d_wave_timestamps;
	output.p_wave_timestamps = p_wave_timestamps;
	output.internal_frequency = o.internal_frequency;

end


% private functions necessary for the stimulation protocol:
function createStimulationTimer(stimulation_time)
	t = timer;
    disp(t.Name);
	user_data.stimulation_time = stimulation_time;
	user_data.executed_stimulation_time =  0;

	t.ExecutionMode = 'singleShot';
	t.TimerFcn = @sendStimulation;
	t.UserData = user_data;

    delay = stimulation_time - toc;
    disp(num2str(delay));
    
	if stimulation_time - toc > 0
		t.StartDelay = stimulation_time - toc;
		start(t);
	else 
		delete(t);
	end
end

function sendStimulation(mTimer, ~)
	global executed_stimulation_times
    global Master8

	user_data = mTimer.UserData;

	% we send the stimulation only if there is no other stimulation that was triggered less than 20 ms ago.
	if isempty(executed_stimulation_times) || abs(min(toc - executed_stimulation_times)) > 0.100
		Master8.Trigger(3);
		exec_time = toc;
		executed_stimulation_times = [executed_stimulation_times exec_time];
		user_data.executed_stimulation_time = exec_time;
        mTimer.UserData = user_data;
	end
end

