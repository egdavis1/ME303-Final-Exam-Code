%File Name: AdamBashforthMethod.m
%This solves the 1st order ODE using the Adam Bashforth Method

clear;
%Change these:
numIterations = 100;
deltat = 0.1;

t = 0:deltat:(numIterations*deltat);

%Initialize the arrays being used
%y = y(t), y1 = y'(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);

%Set the initial Conditions, change these
y(1) = 6;

fprintf("t\t\ty\t\ty1\n");

%Change the right side of this
%The below can be written as: y'(t) = 4sin(t) - 3y
fy = @(t, y) (4*sin(t) - 3*y);

%Solve for y2 using explicit Euler
y1(1) = fy(t(1), y(1));
y(2) = y(1) + deltat*(y1(1));

%Solve the ODE using the Adam Bashforth Method
for i = 2:(numIterations)
    y1(i) = fy(t(i), y(i));
    y(i+1) = y(i) + deltat/2*(3*y1(i) - y1(i-1));
    
    fprintf(t(i) + "\t\t" + y(i) + "\t\t" + y1(i) + "\n");
end

%Plot the resulting function
plot(t, y);
xlabel('t [s]');
ylabel('y');

% %ERROR - Comment out all lines below if error is not needed. Note: the
% %anayltical solution must be solved by hand first before calculating the
% %error
% 
% %Change this, analytical solution, make sure that there are . in front of *
% %and / because yA and t are arrays
% yA = 7.*exp(-t).*cos(sqrt(2).*t) + 11./sqrt(2).*exp(-t).*sin(sqrt(2).*t) + sin(t) - cos(t);
% 
% %Calculate error
% error = abs(yA - y);
% %Calculate root mean square error
% rmse = sqrt(sum(error, 'all')^2/length(error));
% %Print out root mean square error
% rmse