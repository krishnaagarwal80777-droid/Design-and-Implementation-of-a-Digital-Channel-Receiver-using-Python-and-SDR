# SDR-Based Digital Channel Receiver for 4G/5G Spectrum Monitoring

## Project Summary

This project implements a basic Software Defined Radio (SDR) based
digital channel receiver using Python. The system performs spectrum
analysis, detects active channels, selects the strongest channel
automatically, extracts it using digital filtering, and displays the
spectrum of the extracted channel.

The project was completed in two major stages:

1.  Simulation of a multi‑channel communication system using Python DSP
2.  Integration with ADALM Pluto SDR to process real RF signals from
    4G/5G bands

The goal is to demonstrate the fundamental operations of a digital
communication receiver such as signal acquisition, FFT spectrum
analysis, channel detection, channel selection, filtering, and spectrum
visualization.

------------------------------------------------------------------------

## Problem Statement

Implementation of a 4G/5G channel receiver using SDR where the output of
any detected channel is displayed as a spectrum on a PC.

------------------------------------------------------------------------

## Work Completed

### Day 1 -- Simulation Development

The first stage focused on building the complete receiver pipeline using
simulated signals.

The following components were implemented:

• Multi‑channel signal generation\
• Noise modelling (AWGN)\
• FFT spectrum analysis\
• Automatic channel detection\
• Strongest channel selection\
• Digital channel receiver using bandpass filtering\
• Channel power measurement\
• Output spectrum visualization

This allowed validation of the receiver design before hardware
integration.

------------------------------------------------------------------------

### Day 2 -- SDR Integration

The second stage replaced the simulated signal source with real RF
samples from Pluto SDR.

Work completed:

• Installation of pyadi‑iio and libiio drivers\
• Pluto SDR connection testing\
• RF sample acquisition\
• FFT processing of real signals\
• Detection of active spectrum channels\
• Extraction of strongest detected channel\
• Display of extracted channel spectrum

The DSP pipeline remained unchanged, demonstrating correct system
design.

------------------------------------------------------------------------

## System Architecture

### Simulation Architecture

Signal Generator (Multi‑Channel Signal)\
↓\
Noise Addition\
↓\
FFT Spectrum Analyzer\
↓\
Channel Detection\
↓\
Strongest Channel Selection\
↓\
Digital Channel Receiver (Bandpass Filter)\
↓\
Extracted Channel Spectrum Display

------------------------------------------------------------------------

### SDR Architecture

Pluto SDR RF Input\
↓\
Digital Sampling\
↓\
FFT Spectrum Analysis\
↓\
Noise Floor Estimation\
↓\
Channel Detection\
↓\
Strongest Channel Selection\
↓\
Digital Channel Receiver\
↓\
Output Channel Spectrum Display

------------------------------------------------------------------------

## Working Principle

### Signal Acquisition

In simulation, multiple sine waves represent communication channels.
Noise is added to simulate real wireless conditions.

In SDR mode, real RF signals are captured directly from Pluto SDR.

------------------------------------------------------------------------

### Spectrum Analysis

Fast Fourier Transform (FFT) converts the time domain signal into
frequency domain representation.

FFT reveals the frequency components present in the received signal.

This allows detection of active communication channels.

------------------------------------------------------------------------

### Channel Detection

Channels are detected by identifying peaks in the FFT magnitude
spectrum.

An adaptive threshold based on noise floor is used to distinguish real
signals from noise.

------------------------------------------------------------------------

### Strongest Channel Selection

The strongest channel is defined as the frequency with highest magnitude
in the spectrum.

This corresponds to the highest power signal and typically represents
the best signal‑to‑noise ratio.

The receiver automatically selects this channel.

------------------------------------------------------------------------

### Digital Channel Receiver

A Butterworth bandpass filter is designed around the detected channel
frequency.

The filter allows only the selected channel to pass while rejecting
other signals.

This stage represents the digital channel receiver.

------------------------------------------------------------------------

### Channel Extraction

The filtered signal contains only the selected channel.

This verifies correct receiver operation.

------------------------------------------------------------------------

### Output Spectrum

FFT is again applied on the filtered signal to display the spectrum of
the extracted channel.

This satisfies the project requirement:

Output of the selected channel is displayed as a spectrum on the PC.

------------------------------------------------------------------------

## Software Requirements

Python 3.x

Libraries:

numpy\
scipy\
matplotlib\
pyadi‑iio\
pylibiio

Installation:

pip install numpy scipy matplotlib pyadi-iio pylibiio

------------------------------------------------------------------------

## Hardware Requirements

ADALM Pluto SDR\
USB cable\
PC or laptop\
Antenna

Optional:

RTL‑SDR

------------------------------------------------------------------------

## Key Python Functions Used

np.arange() -- Creates discrete time samples

np.sin() -- Generates channel signals

np.random.normal() -- Adds Gaussian noise

np.fft.fft() -- Performs frequency analysis

np.fft.fftfreq() -- Creates frequency axis

scipy.signal.find_peaks() -- Detects active channels

np.argmax() -- Selects strongest channel

scipy.signal.butter() -- Designs bandpass filter

scipy.signal.filtfilt() -- Applies digital filter

np.sum() -- Computes signal power

------------------------------------------------------------------------

## Features Implemented

Multi‑channel signal simulation\
FFT based spectrum analyzer\
Automatic channel detection\
Strongest channel selection\
Digital channel extraction\
Spectrum visualization\
SDR integration\
4G/5G band monitoring capability

------------------------------------------------------------------------

## Learning Outcomes

Understanding SDR receiver architecture\
Understanding FFT based spectrum analysis\
Understanding digital filtering\
Understanding signal power measurement\
Understanding RF spectrum monitoring\
Practical exposure to Pluto SDR\
Python based DSP implementation

------------------------------------------------------------------------

## Applications

Spectrum monitoring systems\
Software Defined Radio receivers\
Wireless communication analysis\
Signal intelligence systems\
RF channel monitoring\
Digital communication receivers

------------------------------------------------------------------------

## Future Improvements

Real time spectrum visualization\
Waterfall spectrum display\
Multiple channel extraction\
Channel bandwidth estimation\
Signal classification\
OFDM signal detection\
Automatic noise floor tracking

------------------------------------------------------------------------

## Conclusion

This project demonstrates the design and implementation of a basic SDR
based digital channel receiver. The system successfully detects
channels, selects the strongest signal, extracts it using digital
filtering, and displays its spectrum. The project shows how DSP
techniques can be combined with SDR hardware to analyze real wireless
signals in 4G/5G frequency bands.

The project provides practical understanding of receiver design,
spectrum analysis, and SDR based signal processing.
