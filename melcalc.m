function mel_cepstral_coefficients = melcalc(freq)
	K = columns(freq);
	% 12 coeficientes.
	for n = 1:12
		sum_energy = 0;
		for k = 1:K
			if(abs(freq(k)) == 0)
        	   continue;
        	end
			sum_energy = sum_energy + log(freq(k)) * cos(n * (k - 0.5) * pi / K);
		endfor
		mel_cepstral_coefficients(n) = sum_energy;
	end
end