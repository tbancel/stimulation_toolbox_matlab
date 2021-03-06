function f = visualize_matlab_recording_with_epoch(recording)
	% plot the recording from matlab sampling

	n_figures=size(findobj('type','figure'), 1);
    f=figure(n_figures+1);
    f.Name = erase(recording.filename, '_');

    plot(recording.realtime, recording.realdata); hold on;
    xlabel("Time (s)");
	title(strcat("ECoG ", num2str(recording.filename)));

	for j=1:numel(recording.epoch_starts)
	 	vline(recording.epoch_starts(j,1), 'b');
	 	vline(recording.epoch_ends(j,1), 'b');
	end

	% if isfield(recording, 'executed_stimulation_times')
 	%   stim_times = recording.executed_stimulation_times;
	% 	for k=1:numel(stim_times)
	% 		[min_v, index] = min(abs(recording.realtime - stim_times(1,k)));
	% 		plot(recording.realtime(1, index), recording.realdata(1, index), 'r*'); hold on;
	% 	end
	% end
end