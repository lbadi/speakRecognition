function fbank = filterbanks(min,max,amount,fftsize)

mmax = mel_frequency(max);

mmin = mel_frequency(min);

step = (mmax-mmin)/(amount+1);

k = 1;
for num = mmin:step:mmax
  f(k) = floor((fftsize+1)*mel_inv(num)/(max*2));
  k = k+1;
end

% fbank = zeros(amount,fftsize/2+1);

% for j=1:amount
%     for i=f(j):f(j+1)
%         fbank(j,i) = (i - f(j))/(f(j+1)-f(j));
%     end

%     for i=f(j+1):f(j+2)
%         fbank(j,i) = (f(j+2)-i)/(f(j+2)-f(j+1));
%     end
% end

for m = 2:amount+1
  for k = 1:(fftsize/2+1)
    if(k < f(m-1))
      fbank(m,k) = 0;
    elseif(f(m-1) <= k && f(m) >= k)
      fbank(m,k) = (k - f(m-1))/(f(m) - f(m-1));
    elseif(f(m) <= k && f(m+1) >= k)
      fbank(m,k) = (f(m+1)-k) / (f(m+1) - f(m));
    else
      fbank(m,k) = 0;
    end
  end
end
