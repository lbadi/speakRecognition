function m = mel_inv(freq)
  m = 700 * (exp(freq/1127)-1);
end
