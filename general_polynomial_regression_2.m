% This Matlab code performs a calculation of polynomial regression [1].
%
% Ref. [1] S. Chapra, "Applied numerical methods with MATLAB", Mc Craw Hill, Singapore (2008).
%
% The polynomial function to be fitted: y(x) = a0 + a1*x + a2*x^2 + ... + a5*x^5 + e, where e is an error.  
% The minimization of (e) leads to a coupled linear equation, called a normal equation.
%
% The systems of linear equations can be solved in matrix language, and the
% coefficients are obtained as:
%
% a_coeffs = (Z'*Z)^(-1) * (Z' * y), where Z is given as Z = [ones(size(x)) x x.^2 x.^3 x.^4 x.^5].
%
% March 20, 2025 & UND
%
function [] = general_polynomial_regression_2
clc; clear general_polynomial_regression_2;  
format short 
%
x = [3 4 5 7 8 9 11 12]';
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]';
%
Z = [ones(size(x)) x x.^2 x.^3 x.^4 x.^5]; %  
%
A_mat = Z' * Z;
B_mat = Z' * y;
%
a_coeffs = A_mat\B_mat; % a_coeffs = (Z'*Z)^(-1) * (Z' * y)
%
S_r = sum((y - Z * a_coeffs).^2); 
%
r2 = 1 - S_r/sum((y - mean(y)).^2) ; %
r = sqrt(r2) ; % 
%
s_y_over_x  = sqrt(S_r/(length(x) - length(a_coeffs))) ; % 
%
% y = a0 + a1*x + a2*x^2 + a3*x^3 + a4*x^4 + a5*x^5
y_func = a_coeffs(1) + a_coeffs(2).*x + a_coeffs(3).*x.^2 + a_coeffs(4).*x.^3 + ...
         a_coeffs(5).*x.^4 + a_coeffs(6).*x.^5; % fitted polynomial function of order 5
%
[s_y_over_x, r2, r]
%
% [s_y_over_x, r2, r] = 0.4012    0.9576    0.9786
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
