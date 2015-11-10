function E = logged_energy(frames)
	s = 0;
	for i = 1:160
		s = s + frames(i) ^2 ;
	end
	% Los algoritmos en que base? 2 o 10?
	E = log(s);
end