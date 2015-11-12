function E = logged_energy(frames)
	s = 0;
	for i = 1:160
		s = s + frames(i) ^2 ;
	end
	E = log(s);
end