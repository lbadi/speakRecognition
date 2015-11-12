function frames = frame_separator(s, frame_size)
  frames = s(1:frame_size);
  for index = floor(1+frame_size/2) : frame_size/2 : length(s)
    if(index + frame_size >= length(s))
      break;
    end
    frames = [frames; s(index:index+frame_size-1)];
  end
end
