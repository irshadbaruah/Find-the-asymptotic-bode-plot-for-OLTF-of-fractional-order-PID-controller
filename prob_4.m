clc;
clf;
clear all;
close all;
Kp = 2.3709;
Ki = 13.9684;
Kd = 0.0071;
alpha = 0.7387;
beta = 0.2947;
 T = 0.4;
Wcr = (abs(Ki/Kd))^(1/(alpha + beta));
Wcr1 = (abs(1/0.4));
w = logspace(-2 , 4, 1000);
mask = w < Wcr;
 mask1 = w < Wcr1
mag1 = 20*log10(Kp)*ones(size(w));
mag2 = 20*log10(Kd)*ones(size(w));
mag3 =  (mask).*(20*log10(Ki/Kd)) + (~mask).*(20*(alpha + beta)*log10(w));
mag4 = -20*alpha*log10(w);
mag5 =  (mask1).*(-20*log10(1)) + (~mask1).*(-20*log10(0.4*w));

combined = mag1 + mag2 + mag3 + mag4 + mag5 ;
 
figure(1);
plot(1,1);
semilogx(w, mag1,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;

figure(2);
plot(1,2);
semilogx(w, mag2,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;

figure(3);
plot(1,3);
semilogx(w, mag3,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure (4);
plot(1,4);
semilogx(w, mag4,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure (5);
plot(1,5);
semilogx(w, mag5,'Color','black')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
 
figure(6);
plot(1,6);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
legend('Asymptotic magnitude bode plot','Location','NorthEast')

 
plot(1,1);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
hold on;

 
clc;
clear 
Kp = 2.3709;
Ki = 13.9684;
Kd = 0.0071;
alpha = 0.7387;
beta = 0.2947;
 T = 0.4;

w=logspace(-2,4,1000);
Mag=@(w) (20*log10(abs(sqrt(Kp).^2)) + 20*log10(abs(sqrt(Kd).^2)) + 20*log10(abs(sqrt((i.*w).^(alpha+beta) + ((i.*w).^alpha)/Kd + (Ki/Kd)).^2)) - 20*log10(abs(sqrt((T*(i.*w)) + 1).^2)) - 20*log10(abs(sqrt(i*w).^alpha).^2));   
semilogx(w,Mag(w) ,'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)','FontSize', 15);
ylabel('Magnitude (dB)','FontSize', 15);
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')
