% This Matlab code performs a calculation of multiple linear regression [1].
%
% Ref. [1] S. Chapra, "Applied numerical methods with MATLAB", Mc Craw Hill, Singapore (2008).
%
% The linear function of x1 and x2 to be fitted: y(x) = a0 + a1*x1 + a2*x2 e, where e is an error.  
% The minimization of (e) leads to a coupled linear equation, called a normal equation.
%
% The coefficients, a0, a1, and a2 are solution of the normal equation:
%         n * a0 +      sum(x1_i) * a1 +      sum(x2_i) * a2 = sum(y_i)
%  sum(x1_i)* a0 +    sum(x1^2_i) * a1 + sum(x2_i*x1_i) * a2 = sum(y_i *x1_i)
%  sum(x2_i)* a0 + sum(x1_i*x2_i) * a1 +    sum(x2^2_i) * a2 = sum(y_i *x2_i)
%
% Written by Tsogbayar Tsednee (PhD)
% Contact email: tsog215@gmail.com
%
% March 20, 2025 & & University of North Dakota 
%
function [] = multiple_linear_regression
clc; clear multiple_linear_regression; 
format short 
%
% data in (x,y) pairs
x1 = [60 62 67 70 71 72 75 78];              % x1_{i}    
x2 = [22 25 24 20 15 14 14 11 ];             % x2_{i}  
y = [140 155 159 179 192 200 212 215];       % y_{i}
%
n = length(x1);
sm_x1 = sum(x1); sm_x2 = sum(x2); 
sm_y = sum(y); sm_x1y = sum(x1.*y); sm_x2y = sum(x2.*y);
sm_x1sq = sum(x1.^2); 
sm_x2sq = sum(x2.^2); 
sm_x1x2 = sum(x1.*x2);
%
A_mat = [
n sm_x1 sm_x2;
sm_x1 sm_x1sq sm_x1x2;
sm_x2 sm_x1x2 sm_x2sq;
];
%
b_mat = [
sm_y; 
sm_x1y;
sm_x2y;
];
%
a_coeffs = A_mat\b_mat; % A_mat * a_coeffs  = b_mat, that is A*x = B  
%
y_func = a_coeffs(1) + a_coeffs(2).*x1 + a_coeffs(3).*x2; % multiple linear regression
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
% [r2, r] = 0.9626    0.9811
%
%%%
figure(1)
plot3(x1,x2,y, 'bo', x1,x2,y_func, 'r', 'LineWidth',1.5)
xlabel('$x_{1}$','interpreter','latex')
ylabel('$x_{2}$','interpreter','latex')
zlabel('$y$','interpreter','latex', 'Rotation', 1)
grid on
set(gca,'FontSize',13)
box on

%%%
return
end
