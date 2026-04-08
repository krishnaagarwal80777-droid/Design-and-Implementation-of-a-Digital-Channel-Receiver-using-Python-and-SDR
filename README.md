# SDR-Based Digital Channel Receiver for 4G/5G Spectrum Monitoring

## 1. Project Objective

The goal of this project is to implement a **basic digital channel
receiver** using Python and Software Defined Radio (SDR). The system
detects active channels present in a received signal, selects the
strongest channel automatically, extracts it using digital filtering,
and displays the spectrum of the extracted channel.

The project demonstrates fundamental receiver operations used in modern
wireless communication systems such as LTE and 5G.

The receiver operations implemented include:

• Signal acquisition\
• Frequency spectrum analysis\
• Channel detection\
• Channel selection\
• Channel extraction\
• Spectrum visualization

This project focuses on the **physical layer receiver concepts** rather
than full telecom decoding.

------------------------------------------------------------------------

## 2. What Problem This Project Solves

In wireless communication, multiple signals exist simultaneously in the
spectrum. A receiver must:

1 Detect which channels are active 2 Identify which signal is strongest
3 Select the desired channel 4 Extract that signal 5 Analyze its
spectrum

This project simulates and implements exactly these operations.

The required output is: Display the spectrum of the selected channel on
the PC.

------------------------------------------------------------------------

## 3. Project Approach

The project was developed in two stages:

### Stage 1 -- Simulation

First, the receiver was designed using simulated signals to verify
correctness.

This stage allowed testing: • FFT analysis • Channel detection •
Filtering logic

### Stage 2 -- SDR Implementation

After validation, simulated signals were replaced with real RF samples
captured using Pluto SDR.

This demonstrates how simulation transitions into real hardware
implementation.

------------------------------------------------------------------------

## 4. Overall System Architecture

The receiver follows a simplified digital communication receiver
architecture:

RF Input (Simulation or SDR) ↓ Digital Sampling ↓ FFT Spectrum Analysis
↓ Noise Floor Estimation ↓ Channel Detection ↓ Strongest Channel
Selection ↓ Digital Channel Receiver (Bandpass Filter) ↓ Channel
Extraction ↓ Output Channel Spectrum

Each stage corresponds to a real receiver block.

------------------------------------------------------------------------

## 5. Detailed Block Explanation

### Block 1 -- Signal Acquisition

This block provides the input signal to the receiver.

Two modes exist:

Simulation Mode: Multiple sine waves represent different communication
channels.

Example:

x(t) = sin(2πf₁t) + sin(2πf₂t) + sin(2πf₃t)

Noise is added to simulate wireless channel conditions.

SDR Mode: Real RF signals are captured using Pluto SDR.

The SDR performs:

RF capture Analog to digital conversion Digital sample transfer

The output is a digital time-domain signal.

Purpose of this block: Provide the signal that the receiver must
analyze.

------------------------------------------------------------------------

### Block 2 -- Digital Sampling

In SDR mode, sampling is performed by Pluto hardware.

Sampling converts RF signals into digital samples.

Sampling rate determines frequency resolution.

Nyquist condition:

fs \> 2 × max signal frequency

This ensures no aliasing occurs.

Purpose of this block: Convert RF signals into digital data suitable for
DSP processing.

------------------------------------------------------------------------

### Block 3 -- FFT Spectrum Analysis

This is the most important analysis stage.

The Fast Fourier Transform converts the signal from time domain to
frequency domain.

Time domain: Signal appears complex and hard to interpret.

Frequency domain: Individual channels appear as peaks or energy regions.

FFT performs:

Time → Frequency conversion

Mathematically:

X(k) = Σ x(n)e\^(-j2πkn/N)

Output:

Array of complex values representing frequency components.

Magnitude is computed:

Magnitude = √(real² + imaginary²)

Higher magnitude means stronger signal.

Purpose of this block: Identify which frequencies exist in the received
signal.

------------------------------------------------------------------------

### Block 4 -- Frequency Mapping

FFT output indices must be mapped to frequencies.

FFT only gives magnitudes.

Frequency mapping determines which frequency each index represents.

Frequency resolution:

Δf = fs / N

Where:

fs = sampling rate N = number of samples

This allows plotting frequency spectrum correctly.

Purpose: Convert FFT indices into real frequency values.

------------------------------------------------------------------------

### Block 5 -- Noise Floor Estimation

Real wireless signals contain noise.

Noise floor is estimated by averaging spectrum magnitude.

Noise floor represents baseline spectrum level.

Signals must exceed noise floor significantly to be considered valid.

Threshold selection:

Threshold = noise_floor × factor

Example:

Threshold = noise_floor × 3

Purpose: Separate real signals from noise.

This is common in SDR spectrum sensing.

------------------------------------------------------------------------

### Block 6 -- Channel Detection

Channel detection identifies active channels.

Channels appear as peaks in the frequency spectrum.

Peak detection algorithm checks:

Is magnitude greater than neighbors? Is magnitude above threshold?

If yes → channel detected.

This stage answers:

Which frequencies contain signals?

Purpose: Automatically detect active communication channels.

------------------------------------------------------------------------

### Block 7 -- Strongest Channel Selection

Among detected channels, the receiver selects the strongest signal.

Strongest means:

Highest FFT magnitude Highest signal power Best signal quality

Strongest channel often has highest Signal-to-Noise Ratio (SNR).

This is useful because:

Strong signals are easier to extract. Strong signals are easier to
process.

Selection method:

Find peak with maximum magnitude.

Purpose: Automatically choose the best channel for reception.

------------------------------------------------------------------------

### Block 8 -- Digital Channel Receiver

This is the core receiver stage.

A bandpass filter is designed around the selected channel.

Filter operation:

Pass: Selected frequency ± bandwidth

Reject: All other frequencies

Example:

If channel is 2.3 GHz:

Pass: 2.2999--2.3001 GHz

Reject: Other frequencies

Butterworth filter is used because:

Smooth response No ripple Stable filtering

Purpose: Extract only the selected channel.

This represents the digital channel receiver.

------------------------------------------------------------------------

### Block 9 -- Channel Extraction

After filtering, only the selected channel remains.

Other channels and noise are reduced.

This verifies correct receiver operation.

This stage produces the receiver output signal.

Purpose: Isolate the desired communication channel.

------------------------------------------------------------------------

### Block 10 -- Output Spectrum Display

FFT is applied again on the filtered signal.

This shows:

Only the selected channel remains.

This confirms successful channel extraction.

This satisfies the project requirement:

Display spectrum of selected channel.

Purpose: Verify receiver performance visually.

------------------------------------------------------------------------

## 6. Meaning of Strongest Channel

Strongest channel means:

Frequency with highest power.

Power is proportional to FFT magnitude.

Higher magnitude means:

Higher transmit power Better channel conditions Closer transmitter
Better SNR

Receivers often select strongest signals first.

This project follows same logic.

------------------------------------------------------------------------

## 7. How This Relates to 4G and 5G

Modern LTE and 5G receivers perform similar operations:

RF capture Digital sampling FFT analysis Channel detection Channel
selection Signal extraction

Your project implements these fundamental steps.

Difference:

Real receivers also perform:

Synchronization OFDM demodulation Channel estimation Decoding

Your project focuses only on spectrum receiver portion.

This is appropriate for lab scope.

------------------------------------------------------------------------

## 8. Why Simulation Was Done First

Simulation allows:

Testing DSP logic Debugging algorithms Verifying FFT behavior Testing
filters

Without hardware complications.

After validation, SDR replaces simulation input.

This is standard engineering workflow.

Simulation → Hardware.

------------------------------------------------------------------------

## 9. Learning Outcomes

This project develops understanding of:

Digital signal processing FFT based spectrum analysis Digital filtering
Signal power measurement SDR receiver structure Channel detection
algorithms RF spectrum analysis

It also demonstrates practical integration of Python and SDR.

------------------------------------------------------------------------

## 10. Key Takeaways

The project demonstrates:

How receivers detect channels How strongest signals are selected How
filters extract signals How FFT reveals spectrum How SDR provides real
signals

This provides a strong foundation in DSP and communication receivers.

------------------------------------------------------------------------

## 11. Conclusion

This project successfully implements a simplified digital channel
receiver using Python and SDR. The system detects channels, selects the
strongest signal, extracts it using filtering, and displays its
spectrum.

The project demonstrates how fundamental DSP techniques are used in real
communication receivers and provides practical understanding of
SDR-based signal processing.

This work forms a foundation for advanced topics such as LTE and 5G
receiver design.
