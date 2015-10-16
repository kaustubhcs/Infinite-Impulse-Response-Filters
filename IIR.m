%% Infinite Impulse Response Filter Design
% This code will prove to be classic example for proper use of the given
% functions for Butterworth filter, Chebyshev Type 1 filter and Chebyshev 
% Type 2 Filter Design

%% Inputs Provided


% Passband Attenuation
Ap = 3;

% Sampling Frequency
Fs = 500;

% Stopband Attenuation
As = 60;

% Passband Frequency
Wp = 40;

% Dividing by Sampling Frequeny
Wp = Wp / Fs;

% Stopband Frequency
Ws = 150;

% Dividing by Sampling Frequeny
Ws = Ws / Fs;


%% Verification by butterord

[n,Wn] = buttord(Wp,Ws,Ap,As);
[b,a] = butter(n,Wn);
%figure(); 
[h,w] = freqz(b,a);

W = w*Fs/pi;
h = abs(h);
figure();
subplot(3,1,1);
plot(W,h);
title('Butterworth Filter')

% dataIn = randn(1000,1);
% dataOut = filter(b,a,dataIn);
% figure();
% plot (dataIn);
% figure();
% plot (dataOut);



[n,Wp] = cheb1ord(Wp,Ws,Ap,As);
[b,a] = cheby1(n,Ap,Wp);
[h,w] = freqz(b,a);
W = w*Fs/pi;
h = abs(h);
subplot(3,1,2);
plot(W,h);
title('Chebyshev Type I Lowpass Filter')




[n,Wp] = cheb2ord(Wp,Ws,Ap,As);
[b,a] = cheby2(n,Ap,Wp);
[h,w] = freqz(b,a);
W = w*Fs/pi;
h = abs(h);
subplot(3,1,3);
plot(W,h);
title('Chebyshev Type II Lowpass Filter')



