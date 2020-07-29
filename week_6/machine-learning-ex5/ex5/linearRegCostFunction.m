function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

predictions = X * theta ;
J = sum((predictions - y).^2)/(2 * m);

# adding regularisation
Theta = theta;
Theta(1) = [];
J = J + lambda * sum(Theta.^2) /(2 * m);

# gradient calculations
#sum_term =  lambda * Theta / m;
#sum_term = [0; sum_term]
#grad = ((1/m)* (predictions-y)' * X) .+ sum_term;

# what is the difference between this and above check

gradient_regularising_term = lambda/m * Theta;
gradient_regularising_term = [0; gradient_regularising_term];
grad = (1/ m * X' * (predictions - y)).+ gradient_regularising_term;


% =========================================================================

grad = grad(:);

end
