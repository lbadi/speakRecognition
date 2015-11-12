function test(training_path,test_path)

	% Se entrena con todos los archivos que hay en training path
	files = readdir(training_path);
	training_quantity = length(files);
	vector_quantity = 16;
	for i = 3:training_quantity
		file_name = char(files(i));
		complete_path = strcat(training_path, file_name);
		keyboard
		mel_coef = mfcc_extract(complete_path);
		vecCode(:,:,i-2) = vq(mel_coef, vector_quantity);
		% Armo un cell con los nombres
		names{i-2} = substr(file_name, 1, -6);
	end
	keyboard;

end
