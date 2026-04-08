**4G/5G Channel Receiver using SDR (MATLAB)**

**Introduction**

This project implements a **software-defined 4G/5G channel receiver** using the **ADALM-PLUTO SDR** and MATLAB. SDR shifts signal processing tasks such as filtering, demodulation, and spectrum analysis into software, enabling flexibility and reconfigurability.
The system captures real-time RF signals, performs **FFT-based spectrum analysis**, automatically detects multiple channels, selects the strongest channel, and extracts it digitally for visualization.


**Hardware Used**

 🔹 ADALM-PLUTO SDR

The **ADALM-PLUTO SDR** is a compact SDR platform with:

* Frequency range: ~325 MHz to 3.8 GHz (extendable)
* Built-in ADC and DAC
* USB interface for PC communication
* RF transceiver (AD9363)

### Function in Project:

* Receives RF signals via antenna
* Converts RF → baseband I/Q samples
* Sends digital samples to MATLAB


# System Working Principle

##  Signal Flow

RF Signal → Antenna → Pluto SDR → ADC → I/Q Samples → MATLAB Processing → Spectrum Output


## Step-by-Step Operation

        ┌───────────────┐
        │   RF Signal   │
        │ (4G/5G Bands) │
        └──────┬────────┘
               ↓
        ┌───────────────┐
        │   Antenna     │
        └──────┬────────┘
               ↓
        ┌──────────────────────┐
        │  ADALM-PLUTO SDR     │
        │ (RF Front-End + ADC) │
        └──────┬───────────────┘
               ↓
        ┌──────────────────────┐
        │   I/Q Sample Output  │
        └──────┬───────────────┘
               ↓
        ┌──────────────────────┐
        │      MATLAB          │
        │ Signal Processing    │
        └──────┬───────────────┘
               ↓
     ┌──────────────────────────────
     │   FFT Spectrum Analysis      │
     └──────────┬───────────────────┘
                ↓
    ┌──────────────────────────────┐
    │ Automatic Peak Detection     │
    └──────────┬───────────────────┘
               ↓
    ┌──────────────────────────────┐
    │ Strongest Channel Selection  │
    └──────────┬───────────────────┘
               ↓
    ┌──────────────────────────────┐
    │ Digital Bandpass Filtering   │
    │ (Channel Extraction)         │
    └──────────┬───────────────────┘
               ↓
    ┌──────────────────────────────┐
    │ Spectrum Visualization (PC)  │
    └──────────────────────────────┘
   
### 🔹 Step 1: RF Signal Acquisition

The antenna captures real-world wireless signals (4G/5G). The Pluto SDR downconverts the RF signal to baseband and digitizes it.


### 🔹 Step 2: I/Q Signal Representation

The received signal is represented as:

[ x[n] = I[n] + jQ[n] ]

* I → In-phase component
* Q → Quadrature component

This complex representation preserves amplitude and phase information.

### 🔹 Step 3: Spectrum Analysis using FFT

The time-domain signal is converted into frequency domain using FFT:

###  Purpose:

* Identify frequency components
* Detect multiple channels
* Estimate signal strength

### 🔹 Step 4: Power Spectrum Calculation

The magnitude of FFT gives signal power:

This helps distinguish:

* Strong signals (peaks)
* Noise floor


### 🔹 Step 5: Automatic Channel Detection

Using peak detection:

* Local maxima in spectrum are identified
* Thresholding removes noise

Mathematically:

* If ( P(f) > {threshold} ), it is considered a valid channel


### 🔹 Step 6: Strongest Channel Selection

Among detected peaks:

* Maximum power peak is selected
* Corresponds to strongest signal

f_{max} = arg_max{P(f)} 


### 🔹 Step 7: Digital Channel Extraction

A **bandpass filter** is applied:

* Centered at detected frequency
* Extracts only that channel

This isolates the strongest communication signal.

### 🔹 Step 8: Spectrum Visualization

Two plots are generated:

* Full spectrum (all channels)
* Extracted channel spectrum

This provides real-time monitoring.


#  MATLAB Code Functioning (Explanation)

## 🔹 Receiver Configuration

rx = sdrrx('Pluto', ...)

* Initializes Pluto SDR
* Sets frequency, gain, sampling rate


## 🔹 Signal Acquisition

rxSignal = rx();

* Captures I/Q samples continuously

## 🔹 FFT Computation

fftSignal = fftshift(fft(rxSignal));

* Converts signal to frequency domain
* `fftshift` centers zero frequency


## 🔹 Peak Detection

[pks, locs] = findpeaks(powerSpec)

* Detects all channels
* Returns peak values and positions


## 🔹 Strongest Channel Selection


[~, idx] = max(pks);

* Finds highest peak
* Determines dominant channel


## 🔹 Channel Extraction


bpFilt = designfilt('bandpassfir', ...)

* Designs FIR bandpass filter
* Extracts selected channel


## 🔹 Visualization

plot(freqAxis, powerSpec)

* Displays spectrum in real time



#  Applications

* Spectrum monitoring
* Cognitive radio
* Signal intelligence
* 4G/5G network analysis
* Wireless research

#  Advantages of Proposed System

✔ Real-time operation
✔ Automatic channel detection
✔ No hardware redesign required
✔ Flexible for different bands
✔ Scalable to 5G


#  Conclusion 

The project successfully demonstrates a real-time SDR-based 4G/5G receiver using Pluto SDR and MATLAB. By integrating FFT-based spectrum analysis with automatic peak detection and channel extraction, the system intelligently identifies and isolates the strongest communication channel, making it suitable for modern wireless monitoring applications.


