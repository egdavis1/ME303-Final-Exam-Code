%Matrix
a = [1 1 1 2;
     1 1 2 1;
     1 2 1 1;
     2 1 1 1];
%What the matrix equals
b = [-1; 1; -1; 1];
 
x = linsolve(a, b);
 
x
 