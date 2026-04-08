clc;
clear;
close all;

%% ===============================
% Pluto SDR Configuration
%% ===============================
centerFreq = 1.84e9;       % Center Frequency (scan band)
sampleRate = 10e6;         % Sampling Rate
frameLength = 2^14;
gain = 40;

rx = sdrrx('Pluto', ...
    'CenterFrequency', centerFreq, ...
    'BasebandSampleRate', sampleRate, ...
    'SamplesPerFrame', frameLength, ...
    'GainSource', 'Manual', ...
    'Gain', gain);

%% ===============================
% Parameters for Channel Detection
%% ===============================
N = frameLength;
freqAxis = linspace(-sampleRate/2, sampleRate/2, N);

channelBW = 1e6;     % Assume 1 MHz channel width
threshold = -80;     % Detection threshold (dB)

%% ===============================
% Visualization Setup
%% ===============================
figure;

disp('Smart Spectrum Receiver Running...');

while true
    
    %% Step 1: Receive Signal
    rxSignal = rx();
    
    %% Step 2: FFT Spectrum
    fftSignal = fftshift(fft(rxSignal));
    powerSpec = 20*log10(abs(fftSignal) + 1e-6);
    
    %% Step 3: Peak Detection
    [pks, locs] = findpeaks(powerSpec, 'MinPeakHeight', threshold);
    
    if ~isempty(pks)
        
        % Step 4: Strongest Channel Selection
        [~, idx] = max(pks);
        peakLoc = locs(idx);
        peakFreq = freqAxis(peakLoc);
        
        fprintf('Strongest Channel at: %.2f MHz\n', peakFreq/1e6);
        
        %% Step 5: Channel Extraction (Bandpass Filter)
        f_low = peakFreq - channelBW/2;
        f_high = peakFreq + channelBW/2;
        
        % Design filter
        bpFilt = designfilt('bandpassfir', ...
            'FilterOrder', 100, ...
            'CutoffFrequency1', f_low, ...
            'CutoffFrequency2', f_high, ...
            'SampleRate', sampleRate);
        
        extractedSignal = filter(bpFilt, rxSignal);
        
    else
        peakFreq = 0;
        extractedSignal = rxSignal;
    end
    
    %% Step 6: Plot Spectrum
    subplot(2,1,1);
    plot(freqAxis/1e6, powerSpec);
    title('Full Spectrum');
    xlabel('Frequency (MHz)');
    ylabel('Power (dB)');
    grid on;
    
    hold on;
    if peakFreq ~= 0
        plot(peakFreq/1e6, max(powerSpec), 'ro', 'LineWidth', 2);
    end
    hold off;
    
    %% Step 7: Extracted Channel Spectrum
    fftExtracted = fftshift(fft(extractedSignal));
    powerExtracted = 20*log10(abs(fftExtracted)+1e-6);
    
    subplot(2,1,2);
    plot(freqAxis/1e6, powerExtracted);
    title('Extracted Strongest Channel');
    xlabel('Frequency (MHz)');
    ylabel('Power (dB)');
    grid on;
    
    drawnow;
    
end
