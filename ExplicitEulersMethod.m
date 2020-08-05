%File Name: ExplicitEulersMethod.m
%This solves the 2nd order ODE using the Explicit Eulers Method
%Comment out specified lines if first order ODE. If first order ODE, y''(t)
%in the print statements will all be 0, these can be ignored

clear;
%Change these:
numIterations = 100;
deltat = 0.1;

t = 0:deltat:(numIterations*deltat);

%Initialize the arrays being used
%y = y(t), y1 = y'(t), y2 = y''(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);
y2 = zeros(1, numIterations + 1);

%Set the initial Conditions, change these
y(1) = 6;
%If first order, comment out this line
y1(1) = 5;

fprintf("t\t\ty\t\ty1\t\ty2\n");

%Solve the ODE using the Explicit Eulers Method
for i = 1:(numIterations)
    %Change this line based on ODE given, if first order ODE, y2(i) should
    %be changed to y1(i) and the equation should be arranged for y1(i)
    y2(i) = 4*sin(t(i)) - 3*y(i);% - 2*y1(i) - 3*y(i);
    
    y(i+1) = y(i) + deltat*y1(i);
    %If first order, comment out this line
    y1(i+1) = y1(i) + deltat*y2(i);
    
    fprintf(t(i) + "\t\t" + y(i) + "\t\t" + y1(i) + "\t\t" + y2(i) + "\n");
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