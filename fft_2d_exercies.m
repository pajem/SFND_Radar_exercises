
% 2-D Transform
% The 2-D Fourier transform is useful for processing 2-D signals and other 2-D data such as images.
% Create and plot 2-D data with repeated blocks.
P = peaks(20);
X = repmat(P,[5 10]);
imagesc(X)

% run 2D FFT
signal_fft = fft2(X)
signal_fft = abs(signal_fft);

% shift zero-frequency terms to the center of the array
% this changes the filtering of the signal from filtering the latter half,
% to filtering the first half
signal_fft = fftshift(signal_fft)

% plot 2D data as image
imagesc(signal_fft);