# Toolbox for real time stimulation

## Up and running:

1. Download the code from Github. 
2. Put in your Documents folder
3. Add the code folder to your Matlab path (see video [here](https://www.youtube.com/watch?v=agUQxT0rnXY) on how to do it)
4. Modify the `stimulation_parameters.m` if necessary (which channel you want to sample, etc.). For more information read, the full documentation below.
5. Launch `run_closed_loop_stimulation.m` from your Matlab console

You are good to go !

## How it works:

### Baseline recording:

- The `run_closed_loop_stimulation.m` script first records the signal on the channel (default channel 4) that you choose and for the duration (default 30 seconds) that you setup in the `stimulation_parameters.m` file. You also decide the sampling rate (default 1kHz) and the sampling window duration (default : 200ms).

- At the end of the baseline recording, the signal is displayed and a message in the Matlab console asks you to find a timeperiod without any seizure (so that the algorithm can calibrate for seizure detection).

- Note that the recording is saved in a folder called `closed_loop_recordings` which will be created when you run the toolbox for the first time.

### Stimulation recording:

- Based on the calibration, the algorithm starts the stimulation (with the parameters setup in the `stimulation_parameters.m` file). So far, it is possible to stimulate on waves only (wave positions are predicted in real time thanks to an algorithm that is detailed in the documentation, and stimulations are planned using the `Timer` function from Matlab). It is also possible to set the parameters so that the algorithm stimulates as soon as an epoch is labelled as a seizure.

- To be used for later, the recording is also saved in the same folder but with a different name.


## Useful documents:

The list of all needed softwares, drivers, and version is available in the full document. Explanation about how the code works is also provided. It is highly recommended to read all the document to have the whole picture of the whole project.

- Full documentation [here](https://docs.google.com/document/d/1KSDnj4kaBZcaxWJyh2HyH4MV9eeVU_yVuVEYQM3cIAU/edit?usp=sharing)

- [My internship report](https://docs.google.com/document/d/19hcyojKGd4uzZ_uIo5cIF0tA5ga-aji2IAOFyNr467k/edit?usp=sharing)

- Oral presentation presenting my work [here](https://docs.google.com/presentation/d/1XjblCYBWI6oWqX6hjk8_wT908769XpEk8OyCmXUPEms/edit?usp=sharing)


