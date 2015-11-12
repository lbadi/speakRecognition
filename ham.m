function ham_frames = ham(frames, N)
  for i = 1:rows(frames)
      ham_frames(i, :) = frames(i, :) .* window(N);
  end
end


function ham_frame = window(N)
  for i = 1:N
    ham_frame(i) = 0.54 - 0.46*cos(2*pi * ((i-1)/(N-1)));
  end
end
