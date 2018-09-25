function f = visualize_matlab_recording_with_seizure(recording)
	if isfield(recording, 'seizures')
		seizure_info = compute_rt_detected_seizure_info(recording);
		f = visualize_labelled_recording(recording.realdata, recording.realtime, seizure_info, recording.filename)
	end
end
