%%%%%%%%%%%%%%%%%%%%%%%%
% Variable declaration:
global stim_params; % structure with the parameters for stimulation
global baseline_recording_time; % number of seconds to record
global stimulation_recording_time; % number of seconds with stimulation on
global threshold_value_nf_ll; % threshold value

global approx_epoch_timelength; % 200ms the CED will sample every XX seconds
global recording_time; % in seconds
global sampling_rate_ced; % in Hz /!\ be careful, period must be a multiple of the clock period.
global channel_to_sample; % channel of the CED that is sampled (ADC: analog to digital converter) and send to the computer
global stimulation_duration;

global planned_stimulation_times;
global executed_stimulation_times;

global AMPI_paradigm; % not used yet
global AMPI_channel_stimulation; % not used yet
global AMPI_channel_recording_starts; % not used yet
global AMPI_channel_recording_ends; % not used yet

planned_stimulation_times = [];
executed_stimulation_times = [];


%%%%%%%%%%%%%%%%%%%%%%%%
% 1.recording parameters

baseline_recording_time = 30; % number of seconds to record for baseline
stimulation_recording_time = 600; % number of seconds with stimulation on
approx_epoch_timelength = 0.2; % 200ms the CED will sample every XX seconds
sampling_rate_ced = 1000; % in Hz /!\ be careful, period must be a multiple of the clock period.
channel_to_sample = 4; % channel of the CED that is sampled (ADC: analog to digital converter) and send to the computer


%%%%%%%%%%%%%%%%%%%%%%%%
% 2.detection parameters
% optimal value determined during my internship (1.57) to detect seizure optimally.
% threshold_value_nf_ll = 1.57;
threshold_value_nf_ll = 1.57; % threshold value 


%%%%%%%%%%%%%%%%%%%%%%%%
% 3. stimulation parameters / � developper plus tard.

% position of the 
% possible values are : 
% 'w' : stimulate on predicted 'waves'
% 's' : stimulate on predicted 'spikes'
% 'asap': no particular position, as soon as an epoch is labelled as seizure, launch the stimulation 
stim_param.stimulation_position = 'w';

% stimulation duration in seconds 
% the stimulation will continue for the stimulation duration even if 
% the seizure has stopped before the end of the stimulation 
% 
% choose -1 if you want to stimulate until seizure stops.
% stim_param.stimulation_duration = 1; 

% minimal spacing between 2 consecutive stimuations
% a short inter-ictal period (shorter than the minimal stimulation spacing) will results in
% 
% choose -1 if you don't want any minimal spacing
% stim_param.minimal_stimulation_spacing = 1;
