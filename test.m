function test(training_path, test_path)
	more off;

	%
	% Los paths tienen que venir en formato {directory_name}/, ej: /home/nicolas/MNA/training/
	%

	% Se entrena con todos los archivos que hay en training path
	files = readdir(training_path);
	training_quantity = length(files);
	vector_quantity = 16;
	for i = 3:training_quantity
		file_name = char(files(i));
		complete_path = strcat(training_path, file_name);
		mel_coef = mfcc_extract(complete_path);

		vector_codes(:,:, i-2) = vq(mel_coef', vector_quantity);

		% Armo un cell con los nombres
		names{i-2} = substr(file_name, 1, -5);
	end


	% Por cada archivo en el path de testeo, se intenta ver de quien es:
	total = 0;
	files = readdir(test_path);
	testing_quantity = length(files);
	vector_quantity = 16;
	for i = 3:testing_quantity
		file_name = char(files(i));
		complete_path = strcat(test_path, file_name);
		mel_coef = mfcc_extract(complete_path);
		for j = 3:training_quantity
			test_codes(j-2) = meandist(mel_coef', vector_codes(:, :, j-2));
		end
		[m, min_index] = min(test_codes);

		results{i-2} = names{min_index};
		printf('%s => %s\n', substr(file_name, 1, -5), results{i-2})
		if(strcmp(results{i-2},substr(file_name, 1, -5)))
			total++;
		end
	end
	percentaje = 100 * total/(testing_quantity-2);
	printf('El porcentaje de aciertos es: %f\n', percentaje)
end
