%This function solves the 2nd order ODE using the RK4 method

clear;
%Change these:
numIterations = 10;
h = 0.1; %h is the equivalent of deltat

t = 0:h:(numIterations*h);
%Initialize the arrays being used
%y = y(t), y1 = y'(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);
    
%Initial Conditions, change these
y(1) = 6;
y1(1) = 5;

%Functions for the two first order ODEs
%Change the right side of these once manually split the second order ODE
%into two first order ODE's
%The below can be written as: y'(t) = 4sin(t) - 2y' - 3y and y''(t) = y'
fy = @(t, y, y1) (4*sin(t) - 2*y1 - 3*y);
fy1 = @(t, y, y1) (y1);

fprintf("t\t\ty\t\t\ty1\n");

%Solve the ODE using RK4 Method
for i = 1:numIterations
    k1y = fy1(t(i), y(i), y1(i));
    k1u = fy(t(i), y(i), y1(i));
    k2y = fy1(t(i) + h/2, y(i)+ h*k1u/2, y1(i) + h*k1u/2);
    k2u = fy(t(i) + h/2, y(i) + h*k1y/2, y1(i) + h*k1u/2);
    k3y = fy1(t(i) + h/2, y(i) + h*k2u/2, y1(i) + h*k2u/2);
    k3u = fy(t(i) + h/2, y(i) + h*k2y/2, y1(i) + h*k2u/2);
    k4y = fy1(t(i) + h, y(i) + h*k3u, y1(i) + h*k3u);
    k4u = fy(t(i) + h, y(i) + h*k3y, y1(i) + h*k3u);
    
    y(i+1) = y(i) + h/6*(k1y + 2*k2y + 2*k3y + k4y);
    y1(i+1) = y1(i) + h/6*(k1u + 2*k2u + 2*k3u + k4u);
    
    fprintf(t(i) + "\t\t" + y(i) + "\t\t" + y1(i) + "\n");
end

%Plot the resulting function
plot(t, y);
xlabel('t [s]');
ylabel('y');
