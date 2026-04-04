# Design-and-Implementation-of-a-Digital-Channel-Receiver-using-Python-and-SDR
## Project Overview

This project implements a basic digital channel receiver using Python
signal processing techniques and Software Defined Radio (SDR) concepts.
The system detects multiple frequency channels present in a received
signal, automatically identifies the strongest channel, extracts it
using digital filtering, and displays its spectrum on a computer.

The project is developed in two stages:

1.  Simulation stage using synthetic multi-channel signals
2.  Hardware stage using SDR to receive real RF signals

The objective is to demonstrate fundamental receiver operations such as
spectrum analysis, channel detection, channel selection, and signal
extraction using Digital Signal Processing (DSP).

------------------------------------------------------------------------

## Problem Statement

Design and implement a simple channel receiver in which the output of
any detected channel is displayed as a frequency spectrum on a PC.

------------------------------------------------------------------------

## Project Objectives

• Simulate a multi-channel communication environment\
• Perform frequency domain analysis using FFT\
• Detect available channels automatically\
• Implement a digital channel receiver using filtering\
• Extract the strongest detected channel\
• Display the spectrum of the extracted channel\
• Integrate SDR hardware for real signal acquisition

------------------------------------------------------------------------

## System Architecture

### Simulation Architecture

Signal Source (Simulated Multi-Channel Signal)\
↓\
Noise Modeling\
↓\
FFT Spectrum Analysis\
↓\
Channel Detection\
↓\
Digital Channel Receiver (Bandpass Filter)\
↓\
Extracted Channel Spectrum Display

------------------------------------------------------------------------

### SDR Implementation Architecture

RF Signal Source\
↓\
RTL-SDR Receiver\
↓\
Digital Sampling\
↓\
FFT Spectrum Analysis\
↓\
Channel Detection Algorithm\
↓\
Digital Channel Receiver\
↓\
Spectrum Visualization on PC

------------------------------------------------------------------------

## Working Principle

The project follows the basic structure of a digital communication
receiver.

### Signal Acquisition

Multiple sinusoidal signals are generated to simulate different
communication channels. These signals represent carriers at different
frequencies.

Mathematical model:

x(t) = sin(2πf₁t) + sin(2πf₂t) + sin(2πf₃t)

Noise is added to simulate real wireless channel conditions.

------------------------------------------------------------------------

### Frequency Spectrum Analysis

The Fast Fourier Transform (FFT) is applied to convert the time domain
signal into the frequency domain. This allows identification of
individual channels as peaks in the spectrum.

FFT converts:

Time domain → Frequency domain

The magnitude of FFT indicates signal strength at each frequency.

------------------------------------------------------------------------

### Channel Detection

Channel detection is performed using peak detection on the FFT magnitude
spectrum. Peaks above a defined threshold are treated as valid
communication channels.

Detected channels correspond to dominant frequency components.

------------------------------------------------------------------------

### Strongest Channel Selection

The strongest channel is identified by selecting the peak with the
highest magnitude.

Meaning of strongest channel:\
The frequency component with highest power in the received signal.

This typically represents the signal with best signal-to-noise ratio.

------------------------------------------------------------------------

### Digital Channel Receiver

The receiver extracts the selected channel using a bandpass filter
centered around the detected frequency.

Filter operation:

Pass band:\
f_center ± bandwidth

Reject:\
All other frequencies

A Butterworth bandpass filter is used due to its smooth frequency
response.

------------------------------------------------------------------------

### Channel Extraction

The bandpass filter removes unwanted channels and noise, leaving only
the selected channel.

This stage represents the digital channel receiver block.

------------------------------------------------------------------------

### Spectrum Visualization

The extracted channel is analyzed again using FFT to verify successful
channel reception. The output spectrum confirms that only the desired
channel remains.

This satisfies the requirement:\
"The output of any channel should be displayed as a spectrum on the PC."

------------------------------------------------------------------------

## Software Requirements

Python 3.x\
NumPy\
SciPy\
Matplotlib\
pyrtlsdr (for SDR stage)

Installation:

pip install numpy scipy matplotlib pyrtlsdr

------------------------------------------------------------------------

## Hardware Requirements (SDR Stage)

RTL-SDR USB dongle\
Antenna\
PC/Laptop

Optional alternatives:

ADALM Pluto SDR\
HackRF

------------------------------------------------------------------------

## Simulation Implementation Steps

1 Generate multi-channel signal\
2 Add Gaussian noise\
3 Compute FFT spectrum\
4 Detect peaks (channels)\
5 Identify strongest channel\
6 Design bandpass filter\
7 Extract channel\
8 Display spectrum

------------------------------------------------------------------------

## SDR Implementation Steps

1 Install pyrtlsdr library\
2 Install RTL drivers using Zadig\
3 Connect SDR device\
4 Read RF samples using Python\
5 Replace simulated input with SDR samples\
6 Run FFT analysis\
7 Detect channels\
8 Extract selected channel\
9 Display real spectrum

------------------------------------------------------------------------

## Key Python Functions Used

np.arange() -- Creates time samples for signal generation

np.sin() -- Generates sinusoidal channel signals

np.random.normal() -- Simulates wireless noise

np.fft.fft() -- Computes frequency spectrum

np.fft.fftfreq() -- Generates frequency axis

scipy.signal.find_peaks() -- Detects channels in spectrum

scipy.signal.butter() -- Designs bandpass filter

scipy.signal.filtfilt() -- Applies digital filter

np.argmax() -- Finds strongest channel

------------------------------------------------------------------------

## Project Features

Multi-channel signal simulation\
FFT based spectrum analysis\
Automatic channel detection\
Automatic strongest channel selection\
Digital channel extraction\
Spectrum visualization\
Real RF integration capability

------------------------------------------------------------------------

## Learning Outcomes

Understanding FFT based spectrum analysis\
Understanding digital channel receivers\
Understanding signal filtering\
Practical exposure to SDR concepts\
Implementation of DSP algorithms in Python\
Understanding signal power measurement

------------------------------------------------------------------------

## Applications

Spectrum monitoring\
Software Defined Radio\
Digital communication receivers\
Signal intelligence systems\
Wireless channel analysis\
RF signal monitoring

------------------------------------------------------------------------

## Future Improvements

Real-time spectrum visualization\
Waterfall spectrum display\
Multiple channel extraction\
Channel bandwidth estimation\
Signal classification\
OFDM signal detection

------------------------------------------------------------------------

## Conclusion

This project demonstrates the implementation of a basic digital channel
receiver using Python and SDR concepts. The system successfully detects
multiple channels, automatically selects the strongest signal, extracts
it using filtering, and displays its spectrum. The SDR integration
enables extension from simulation to real RF signal analysis.
