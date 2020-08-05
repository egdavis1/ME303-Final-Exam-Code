%This function solves the 1st order ODE using the RK4 method

clear;
%Change these:
numIterations = 10;
h = 0.1; %h is the equivalent of deltat

t = 0:h:(numIterations*h);
    
%Initialize the arrays being used
%y = y(t), y1 = y'(t)
y = zeros(1, numIterations + 1);
y1 = zeros(1, numIterations + 1);
    
%Initial Condition
y(1) = 0.147; %[m]    
    
%Function for the ODE
%Change the ride side of the below line based on the ODE given
%The below can be written as: y'(t) = y + t^2
fy = @(t, y) (y + t^2);

fprintf("t\t\ty\n");

%Solve the ODE using RK4 Method
for i = 1:numIterations
    k1 = fy(t(i), y(i));
    k2 = fy(t(i) + h/2, y(i) + h*k1/2);
    k3 = fy(t(i) + h/2, y(i) + h*k2/2);
    k4 = fy(t(i) + h, y(i) + h*k3);
        
    y(i+1) = y(i) + h/6*(k1 + 2*k2 + 2*k3 + k4);
      
    y(i) = fy(t(i), y(i));
    
    fprintf(t(i) + "\t\t" + y(i) + "\n");
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
