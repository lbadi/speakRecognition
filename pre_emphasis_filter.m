function s = pre_emphasis_filter(y)
  a = 0.97;
  for i = 2:length(y)
    s(i) = y(i) - a*y(i-1);
  end
end
