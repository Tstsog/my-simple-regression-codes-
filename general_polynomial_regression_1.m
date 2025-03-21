% This Matlab code performs a calculation of polynomial regression [1].
%
% Ref. [1] S. Chapra, "Applied numerical methods with MATLAB", Mc Craw Hill, Singapore (2008).
%
% The second-order polynomial or quadratic function to be fitted: y(x) = a0 + a1*x + a2*x^2 + e, where e is an error.  
% The minimization of (e) leads to a coupled linear equation, called a normal equation.
%
% The coefficients, a0, a1 and a2 are solution of the normal equation:
%          n * a0 +   sum(x_i) * a1 + sum(x^2_i) * a2 = sum(y_i)
%    sum(x_i)* a0 + sum(x^2_i) * a1 + sum(x^3_i) * a2 = sum(y_i * x_i)
%  sum(x^2_i)* a0 + sum(x^3_i) * a1 + sum(x^4_i) * a2 = sum(y_i * x^2_i)
%
% This system of linear equations can be solved in matrix language, and the
% coefficients are obtained as:
%
% a_coeffs = (Z'*Z)^(-1) * (Z' * y), where Z is given as Z = [ones(size(x)) x x.^2].
%
% Written by Tsogbayar Tsednee (PhD)
% Contact email: tsog215@gmail.com
%
% March 20, 2025 & & University of North Dakota 
%
function [] = general_polynomial_regression_1
clc; clear general_polynomial_regression_1;  
format short 
%
x = [0, 1, 2, 3, 4, 5]';
y = [2.1, 7.7, 13.6, 27.2, 40.9, 61.1]';
%
Z = [ones(size(x)) x x.^2];
%
A_mat = Z' * Z;
B_mat = Z' * y;
%
a_coeffs = A_mat\B_mat; % a_coeffs = (Z'*Z)^(-1) * (Z' * y)
%
S_r = sum((y - Z * a_coeffs).^2); % 3.7466
%
r2 = 1 - S_r/sum((y - mean(y)).^2) ; % 0.9985
r = sqrt(r2) ; % 0.9993
%
s_y_over_x  = sqrt(S_r/(length(x) - length(a_coeffs))) ; % 1.1175
%
% y = a0 + a1*x + a2*x^2 + e
y_func = a_coeffs(1) + a_coeffs(2).*x + a_coeffs(3).*x.^2; % fitted polynomial function of order 2
%
[s_y_over_x, r2, r]
%
% [s_y_over_x, r2, r] = 1.1175    0.9985    0.9993
%
%%%
%
figure(1)
hold on
plot(x,y,'bo', 'LineWidth',1.5)
plot(x,y_func, 'r-', 'LineWidth',1.5)
hold off
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex', 'Rotation',1) 
set(gca,'FontSize',16)
box on


%%%
return
end
