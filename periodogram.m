function ret = periodogram(frequencies, N)
  ret = (1/N) * (abs(frequencies)).^2;
end
