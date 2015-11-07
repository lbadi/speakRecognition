function main(filepath)
  frame_lap = 0.02;
  [y, fs, nbits] = wavread(filepath);
  s = pre_emphasis_filter(y);
  frames = frame_separator(s, frame_lap, fs);
  for i = 1 : rows(frames)
    fourier_freq = fft(frames(i,:).*hamming(frame_lap * fs));
    mel_freq(i, :) = mel_frequency(fourier_freq);
  end
end
