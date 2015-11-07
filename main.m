function main(filepath)
  frame_lap = 0.02;
  [y, fs, nbits] = wavread(filepath);
  % Quantity of filters 33
  filter_amount = 33;
  % Size of fast fourier transform
  fft_size = 256;
  fbanks = filterbanks(300,fs/2, filter_amount, fft_size);
  s = pre_emphasis_filter(y);
  frames = frame_separator(s, frame_lap, fs);
  for i = 1 : rows(frames)
    fourier_freq = fft(frames(i,:).*hamming(frame_lap * fs));

    % Energy
    for fb = 1 : rows(fbanks)
    	energy = 0;
    	filterbank = fbanks(fb,:);
    	for fftpoint = 1 : columns(filterbank)
    		energy += filterbank(fftpoint)*fourier_freq(fftpoint);
    	end
    	filterenergies(fb)=energy;
    end

    mel_freq(i, :) = mel_frequency(fourier_freq);
  end
end
