function ret = filter(min, max, amount, fftsize)

  % The sampling frequency in Hz.
  Fsam = 8000;

  % Nyquist frequency, in Hz.
  % The Nyquist frequency is half your sampling frequency.
  Fnyq = mel_frequency(Fsam);

  % The cut-off frequency of your Low pass filter in Hz.
  % This frequency must be greater than 0 and less than Fnyq.
  Fc=1/4;

  % Create a first-order Butterworth low pass.
  % The returned vectors are of legth n.
  % Thus a first order filter is created with n = 2.
  [b,a]=butter(2, Fc/Fnyq);

  % clear unused variables
  clear("Fnyq", "Fc");
end
