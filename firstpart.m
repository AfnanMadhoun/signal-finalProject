clc;
close all;
clear all;

[music , fs1] = audioread('music.wav');
[msg , fs2] = audioread('msg.wav');
%farr=f2(2:4,end-1)
%sound(f1,Fs);
music = fft(music);  
msg = fft(msg);
figure(1);plot(abs(music))
figure(2);plot(abs(msg))

music(400000:400000+length(msg)-1)=msg;
%music(500000:550030)= msg;
figure(3);plot(abs(music))
R_music=ifft(music);

x=length(music);
%y=length(mssg(700000:750030));

sound(R_music,fs1)
%sound(R_music,fs1)
audiowrite('R_music.wav',R_music,fs1);

R_fft = fft(R_music);
mg = R_fft(400000:400000+length(msg)-1);
R_msg= ifft(mg);
%sound(R_msg,fs1)
