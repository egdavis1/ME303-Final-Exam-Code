%This solves the 1st order ODE using Heun's method

clear;
%Change these:
numIterations = 10;
h = 0.1; %h is the equivalent of deltat

t = 0:h:(numIterations*h);
    
%Initialize the arrays being used
%y = y(t), y1 = y'(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);
    
%Initial Condition, change this
y(1) = 0.147; %[m]    
    
%Function for the ODE
%Change the ride side of the below line based on the ODE given
%The below can be written as: y'(t) = y + t^2
fy = @(t, y) (y + t^2);

fprintf("t\t\ty\n");

%Solve the ODE using Heun's Method
for i = 1:numIterations
    k1 = fy(t(i), y(i));
    k2 = fy(t(i) + h, y(i) + k1*h);
    
    y(i+1) = y(i) + h/2*(k1 + k2);
    
    fprintf(t(i) + "\t\t" + y(i) + "\n");
end

%Plot the resulting function
plot(t, y);
xlabel('t [s]');
ylabel('y');