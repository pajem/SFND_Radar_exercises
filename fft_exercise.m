% sampling rate
duration = 1.5
fs = 1e3
dt = 1/fs
t = 0:dt:duration

% generate signals
A1 = 0.7
f1 = 77
signal1 = A1*cos(2*pi*f1*t)
A2 = 2
f2 = 43
signal2 = A2*cos(2*pi*f2*t)

% add noise
noise = 2*randn(size(t))

signal = signal1 + signal2 + noise

% plot noisy signal
plot(t, signal)
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (s)')
ylabel('X(t)')

% compute fourier transform
N = duration/dt
signal_fft = fft(signal,N);
signal_fft = abs(signal_fft/N); % normalize using the number of samples

% remove negative freq components (mirror/alias)
signal_fft = signal_fft(1:N / 2)


% plot f
df = fs/double(N)
freq_x = 0:df:fs/2 - df
plot(freq_x,signal_fft) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')