function delta = deltas(mel)
	delta = zeros(1,13);
	for t = 3:11
		delta(t) = (2*(mel(t+2)-mel(t-2)) + (mel(t+1)-mel(t-1))) / 10;
	end
	 % casos borde, preguntar si es correcto.
	delta(1) = (2*(mel(3)-mel(1)) + (mel(2)-mel(1))) / 10;
	delta(2) = (2*(mel(4)-mel(1)) + (mel(3)-mel(1))) / 10;
	delta(12) = (2*(mel(13)-mel(10)) + (mel(13)-mel(11))) / 10;
	delta(13) = (2*(mel(13)-mel(11)) + (mel(13)-mel(12))) / 10;
end