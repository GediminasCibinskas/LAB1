clear all;
clc;

%DUOMENØ NUSKAITYMAS

% Paveikslëliø nuskaitymas

% Obuliø
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

% kriauðiø
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

% Ið paveikslëliø apskaièiuojama spalvos intensivumas ir apvalumas
hsv_value_A1=spalva_color(A1); %spalvos intensivumas
metric_A1=apvalumas_roundness(A1); %apvalumas

hsv_value_A2=spalva_color(A2); 
metric_A2=apvalumas_roundness(A2); 

hsv_value_A3=spalva_color(A3); 
metric_A3=apvalumas_roundness(A3); 

hsv_value_A4=spalva_color(A4); 
metric_A4=apvalumas_roundness(A4); 

hsv_value_A5=spalva_color(A5); 
metric_A5=apvalumas_roundness(A5); 

hsv_value_A6=spalva_color(A6);
metric_A6=apvalumas_roundness(A6); 

hsv_value_A7=spalva_color(A7); 
metric_A7=apvalumas_roundness(A7); 

hsv_value_A8=spalva_color(A8); 
metric_A8=apvalumas_roundness(A8); 

hsv_value_A9=spalva_color(A9); 
metric_A9=apvalumas_roundness(A9);

% Ið paveikslëliø apskaièiuojama spalvos intensivumas ir apvalumas
hsv_value_P1=spalva_color(P1); %spalvos intensivumas
metric_P1=apvalumas_roundness(P1); %apvalumas

hsv_value_P2=spalva_color(P2); 
metric_P2=apvalumas_roundness(P2); 

hsv_value_P3=spalva_color(P3); 
metric_P3=apvalumas_roundness(P3); 

hsv_value_P4=spalva_color(P4); 
metric_P4=apvalumas_roundness(P4); 

%sukuriama duomenø matrica x1 ir x2 ið apskaièiuotø parametrø
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

% Norimo atsako parinkimas
T=[1;1;1;-1;-1]; 

%% perceptrono mokymas naudojant du áëjimus ir vienà iðëjimà

% sukuriamos pradinës prametrø reikðmës w1 w2 b
w1 = randn(1);
w2 = randn(1);
b = randn(1);

% Pasvertos sumos skaièiavimas
v1=x1(1)*w1+x2(1)*w2+b;

% Aktyvavimo funkcijos pritaikymas
if v1 > 0
	y = 1;
else
	y = -1;
end
% Klaidos skaièivimas
e1 = T(1) - y;

v2=x1(2)*w1+x2(2)*w2+b;

if v2 > 0
	y = 1;
else
	y = -1;
end

e2 = T(2) - y;

v3=x1(3)*w1+x2(3)*w2+b;

if v3 > 0
	y = 1;
else
	y = -1;
end

e3 = T(3) - y;

v4=x1(4)*w1+x2(4)*w2+b;

if v4 > 0
	y = 1;
else
	y = -1;
end

e4 = T(4) - y;

v5=x1(5)*w1+x2(5)*w2+b;

if v5 > 0
	y = 1;
else
	y = -1;
end

e5 = T(2) - y;



% Skaièiuojama klaida su atliktais penkiaias pavyzdþiais
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);

% mokymo algoritmas
while e ~= 0 % vykdoma kol klaida nëra lygi nuliui
    
    n=0.15; % Mokymo þingsnis
    
    % Pasvertos sumos skaièiavimas
    v1=x1(1)*w1+x2(1)*w2+b;
% Aktyvavimo funkcijos pritaikymas
if v1 > 0
	y = 1;
else
	y = -1;
end
% Klaidos skaièivimas
e1 = T(1) - y;

%atliekama parametrø korekcija
w1=w1+n*e1*x1(1);
w2=w2+n*e1*x2(1);
b=b+n*e1;

v2=x1(2)*w1+x2(2)*w2+b;

if v2 > 0
	y = 1;
else
	y = -1;
end

e2 = T(2) - y;

w1=w1+n*e2*x1(2);
w2=w2+n*e2*x2(2);
b=b+n*e2;

v3=x1(3)*w1+x2(3)*w2+b;

if v3 > 0
	y = 1;
else
	y = -1;
end

e3 = T(3) - y;

w1=w1+n*e3*x1(3);
w2=w2+n*e3*x2(3);
b=b+n*e3;

v4=x1(4)*w1+x2(4)*w2+b;

if v4 > 0
	y = 1;
else
	y = -1;
end

e4 = T(4) - y;

w1=w1+n*e4*x1(4);
w2=w2+n*e4*x2(4);
b=b+n*e4;

v5=x1(5)*w1+x2(5)*w2+b;

if v5 > 0
	y = 1;
else
	y = -1;
end

e5 = T(5) - y;

w1=w1+n*e5*x1(5);
w2=w2+n*e5*x2(5);
b=b+n*e5;
    
% Skaièiuojama klaida su atliktais penkiaias pavyzdþiais
	e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
end
% TIKRINIMAS
% Sudaroma matrica su kitais kintamaisiais tikrinimui ar algoritmas
% tinkamai apsimokë
x3=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_P3 hsv_value_P4];
x4=[metric_A4 metric_A5 metric_A6 metric_P3 metric_P4];

% Teisingi atsakymai
T1=[1;1;1;-1;-1];

% Pasvertos sumos skaièiavimas
v1=x3(1)*w1+x4(1)*w2+b;

% Aktyvavimo funkcijos pritaikymas
if v1 > 0
	y = 1;
else
	y = -1;
end
% Klaidos skaièivimas
e1 = T1(1) - y;

v2=x3(2)*w1+x4(2)*w2+b;

if v2 > 0
	y = 1;
else
	y = -1;
end

e2 = T1(2) - y;

v3=x3(3)*w1+x4(3)*w2+b;

if v3 > 0
	y = 1;
else
	y = -1;
end

e3 = T1(3) - y;

v4=x3(4)*w1+x4(4)*w2+b;

if v4 > 0
	y = 1;
else
	y = -1;
end

e4 = T1(4) - y;

v5=x3(5)*w1+x4(5)*w2+b;

if v5 > 0
	y = 1;
else
	y = -1;
end

e5 = T1(5) - y;

% Skaièiuojama klaida su atliktais penkiaias pavyzdþiais jeigu klaida lygi
% nuliui tai algoritmas apsimokë teisingai
	e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5)
