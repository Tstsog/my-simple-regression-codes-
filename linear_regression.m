% This Matlab code performs a calculation of linear regression [1].
%
% Ref. [1] S. Chapra, "Applied numerical methods with MATLAB", Mc Craw Hill, Singapore (2008).
%
% The linear function to be fitted: y(x) = a0 + a1*x + e, where e is an error.  
% The minimization of (e) leads to a coupled linear equation, called a normal equation.
%
% The coefficients, a0 and a1 are solution of the normal equation:
%        n * a0 +   sum(x_i) * a1 = sum(y_i)
%  sum(x_i)* a0 + sum(x^2_i) * a1 = sum(y_i *x_i)
%
% Written by Tsogbayar Tsednee (PhD)
% Contact email: tsog215@gmail.com
%
% March 20, 2025 & & University of North Dakota 
%
%
function [] = linear_regression
clc; clear linear_regression;  
format short 
%
% data in (x,y) pairs
x = [10 20 30 40 50 60 70 80];                % x_{i}
y = [25 70 380 550 610 1220 830 1450];        % y_{i} 
%
n = length(x);
%%%
A_mat = [n,     sum(x);
        sum(x), sum(x.^2)];
%
B_mat = [sum(y);
         sum(y.*x) ];
%
a_coeffs = A_mat\B_mat; % A_mat * a_coeffs  = b_mat, that is A*x = B 
%
% y = a0 + a1*x
y_func = a_coeffs(1) + a_coeffs(2).*x; % linearly fitted function 
%
y_mean = sum(y)/n;
Sr = sum((y - y_func).^2);      %  
St = sum((y - y_mean).^2);
%
r2 = (St - Sr)/St;   % coefficient of determination (100% fit if r2=1)
r = sqrt(r2);        % correlation coefficient  
%
[r2, r]
%
% [r2, r] = 0.8805    0.9383
%
figure(1)
hold on
plot(x, y, 'ro', 'LineWidth',1.5)
plot(x, y_func, 'b-', 'LineWidth',1.5)
hold off
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex', 'Rotation', 1)
set(gca,'FontSize',13)
box on

%%%
return
end
