function main(filepath)


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

  for i = 1 : rows(frames)
    fourier_freq = fft(frames(i,:));
    power_spec = periodogram(fourier_freq, frame_size);
    % Energy
    for fb = 1 : rows(fbanks)
    	filterbank = fbanks(fb,:);
      energy = 0;
      for k = 1:length(filterbank)
    	  energy += filterbank(k) * power_spec(k);
      end
      filterenergies(fb) = energy;
    end
    loged_energy = log(filterenergies);
    K = length(loged_energy);
    for n = 1:12
      mel_cepstral_coefficients(i,n) = 0;
      for k = 1:K
        if(abs(loged_energy(k)) == inf)
          continue;
        end
        mel_cepstral_coefficients(i,n) += loged_energy(k)* cos(n * (k-0.5) * pi/K);
      end
    end
  end


  %
  % Vectores codigo
  %

end
