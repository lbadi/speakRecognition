function auxmain(filepath)


  %
  %  Calculo de los coeficientes mel-cepstrales
  %

  frame_lap = 0.02;
  [y, fs, nbits] = wavread(filepath);
  % Quantity of filters 33
  filter_amount = 26;
  % Size of fast fourier transform
  fft_size = 256;
  fbanks = filterbanks(300,fs/2, filter_amount, fft_size);
  frame_size = frame_lap * fs;
  s = pre_emphasis_filter(y);
  frames = frame_separator(s, frame_size);
  % FFT para cada frame
  for i = 1 : rows(frames)
    fourier_freq(i,:) = fft(frames(i,:),fft_size);
  end
  % Preguntar para que sirve esta función.
  for i = 1 : rows(frames)
    period_freq(i,:) = periodogram(fourier_freq(i,:), frame_size);
  end
  % Se aplican los filtros
  for i = 1 : fft_size/2
    filter_freq(i,:) = fbanks(:,i) * fourier_freq(i,fft_size/2)';
    % filter_freq(i,:) = fbanks(i,:) * period_freq(i,:)';
  end
  for i = 1 : rows(frames)
    % Los 12 primeros
    for n = 1:12

    loged_filter = log(filter_freq);
    K = length(loged_filter);
      mel_cepstral_coefficients(i,n) = 0;
      for k = 1:K
        % Preguntar por que se da esto, claramente algo estamos haciendo mal
        if(abs(loged_filter(k)) == inf)
          continue;
        end
        mel_cepstral_coefficients(i,n) += loged_filter(k)* cos(n * (k-0.5) * pi/K);
      end
    end
    % El ultimo
    mel_cepstral_coefficients(i,13) = logged_energy(frames);
  end
  %
  % Vectores codigo
  %

end
