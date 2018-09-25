function [timevector, values, interval] = resample_matlab_recording(matlab_recording)
    interval = matlab_recording.interval;
    
    fs = matlab_recording.fs;
    time = matlab_recording.realtime;
    signal = matlab_recording.realdata;
    
    [values, timevector] = resample(signal, time, fs, 3, 1);
    
end