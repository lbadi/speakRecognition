function train(filename, person_name)
  [y, fs, nbits] = wavread(filepath);

  code = vq(y,16);

  save(sprintf('%s', person_name), code);

end
