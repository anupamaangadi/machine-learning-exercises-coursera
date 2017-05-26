function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    
    % simple solution:
    % htheta = X * theta;
    % theta_tmp = zeros(3, 1);
    % for row = 1:size(theta, 1)
        % theta_tmp(row) = theta(row) - alpha / m * sum((htheta - y) .* X(:,row));
    % end
    % theta = theta_tmp;
    
    % advanced solution:
    delta = (1/m) * sum(X .* repmat((X*theta - y), 1, size(X,2)));
    
    theta = (theta' - (alpha * delta))';

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
