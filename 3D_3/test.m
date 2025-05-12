% Parameters
N = 128;

% Create a 1D object (square function)
image = zeros(1, N);
image(N/4:3*N/4) = 1;

% Compute its k-space (Fourier Transform)
k_space = fftshift(fft(image));

% Simulate motion corruption: add random phase
rng(42); % For reproducibility
random_phase = exp(1j * (2*pi*rand(1, N) - pi));
corrupted_k_space = k_space .* random_phase;

amplitude=abs(corrupted_k_space);
phase=angle(k_space);
constant_phase=exp(1j*phase);
rephased_k_space=amplitude.*constant_phase;

% Reconstruct images
image_original = abs(ifft(ifftshift(k_space)));
image_corrupted = abs(ifft(ifftshift(corrupted_k_space)));
image_rephased = abs(ifft(ifftshift(rephased_k_space)));

% Plot
figure;

subplot(1,3,1);
plot(image_original, 'LineWidth', 1.5);
title('Original Image');
ylim([-0.1 1.2]);

subplot(1,3,2);
plot(image_corrupted, 'LineWidth', 1.5);
title('Motion-Corrupted Image');
ylim([-0.1 1.2]);

subplot(1,3,3);
plot(image_rephased, 'LineWidth', 1.5);
title('Rephased Image');
ylim([-0.1 1.2]);

sgtitle('1D k-Space Motion Simulation');
%% 

% Parameters
N = 256;                       % Image size
phantom_mag = phantom('Modified Shepp-Logan', N);  % Real phantom

% Create a synthetic phase map (e.g., smooth spatial phase variation)
[X, Y] = meshgrid(linspace(-1, 1, N), linspace(-1, 1, N));
phase_map = pi * sin(2 * pi * X) .* cos(2 * pi * Y);  % Phase in radians

% Combine into complex image
phantom_complex = phantom_mag .* exp(1j * phase_map);

% Show results
figure;
subplot(1,3,1);
imshow(phantom_mag, []); title('Magnitude (Phantom)');

subplot(1,3,2);
imshow(angle(phantom_complex), []); title('Phase (radians)');

subplot(1,3,3);
imshow(abs(phantom_complex), []); title('Magnitude of Complex Image');


