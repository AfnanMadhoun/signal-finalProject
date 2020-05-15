clc;
close all ; clear all;
%read and show the original image
a=imread('peppers.jpg');
figure(1),imshow(a);title('original image');
b=rgb2gray(a);
figure(2); imshow(b); title('original image');
%FT of the original image
F=fft2(b);
Fsh=fftshift(F);
S=log(1+abs(Fsh));
figure(3); imshow(S,[]); title('Magnitude of FT of the original image');
%freqyency responce of the filter
a=0.9;
f=zeros(41,41);
for n=1:41
    for m=1:41
      if (n==1)&&(m==1)
        x=1;
      else 
        x= (a).^((n-1)+(m-1));
      end 
      f(n,m)= x;
    end
end
pad = padarray(f,[343 471],0,"post");
filfft = fft2(pad);
filftsh = fftshift(filfft);
magnetud = log(abs(filftsh));
figure(4); imshow(magnetud,[]);title('Magnitude of the Frequency Response of the filter.');
%filter the image and show in freqyency domain
photo = F.*filftsh;
d=fftshift(photo);
fil=log(1+abs(d));
figure(5),imshow(abs(fil),[]);title(' Magnitude after processing.');
%filtered image
x=ifft2(d)
%figure(5); imshow(x,[]); title('filtered image');
a=filter2(f,b);
final=log(abs(a));
figure(6); imshow(final,[]); title('Resulting image.');