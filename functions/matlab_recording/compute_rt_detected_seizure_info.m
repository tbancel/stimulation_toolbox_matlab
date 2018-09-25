function seizure_info = compute_rt_detected_seizure_info(matlab_recording)
    % this function computes the seizure_info matrix from what the real
    % time detected / recording has computed from the CED.
    
    seizure_info = [];
    
    if isfield(matlab_recording, 'seizures')
        seizures = matlab_recording.seizures;
        
        % inacurrate but easier (we say the first epoch is not a seizure,
        % same for the last epoch (200ms):
        seizures(1,1) = 0;
        seizures(numel(seizures)) = 0;
        
        d = diff(seizures);
        
        start_seizures_index = find(d == 1)+1;
        end_seizures_index = find(d == -1);
        
        seizure_info = [matlab_recording.epoch_starts(start_seizures_index,1) matlab_recording.epoch_ends(end_seizures_index,1)];
    end
end