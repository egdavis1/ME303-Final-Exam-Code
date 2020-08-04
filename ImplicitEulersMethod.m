%This solves the 2nd order ODE using the Implicit Eulers Method
%Comment out specified lines if first order ODE. If first order ODE, y'(t)
%in the print statements will all be 0, these can be ignored

clear;
%Change these:
numIterations = 10;
deltat = 0.1;

t = 0:deltat:(numIterations*deltat);

%Initialize the arrays being used
%y = y(t), y1 = y'(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);
    
%Initial Conditions, change these
y(1) = 6;
%Comment out this line for first order
y1(1) = 5;

fprintf("t\t\ty\t\t\ty1\n");
for i = 1:numIterations
    %Change this line based on the rearrangement of the function for y(i+1)
    y(i+1) = (y(i)*(1 + 2*deltat) + deltat*y1(i) + 4*deltat^2*sin(t(i)))/(1 + 2*deltat + 3*deltat^2);
    %Comment out this line for 1st order
    y1(i+1) = (y1(i) + 4*deltat*sin(t(i+1)) - 3*deltat*y(i+1))/(1 + 2*deltat);
    fprintf(t(i) + "\t\t" + y(i) + "\t\t" + y1(i) + "\n");
end

%Plot the resulting function
plot(t, y);
xlabel('t [s]');
ylabel('y');

