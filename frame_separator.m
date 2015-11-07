function frames = frame_separator(s, frame_size)
  frames = s(1:frame_size);
  frames = recursive_frame(frames, floor(1+frame_size/2), s, frame_size);
end


function frames = recursive_frame(frames, index, s, frame_size)
  if(index + frame_size >= length(s))
    return;
  else
    frames = [frames; s(index:index+frame_size-1)];
    frames = recursive_frame(frames, floor(index+frame_size/2), s, frame_size);
  end
end
