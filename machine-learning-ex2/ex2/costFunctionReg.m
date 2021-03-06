function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%sum0 = theta(1).^2;
%for i = 2:size(theta)
%   sum1 = (lambda/(2*m))*sum(theta(i).^2);
%end

%J = (1/m)*sum(-y'*log(sigmoid(X*theta))-(1-y')*log(1-sigmoid(X*theta)))+(lambda/(2*m))*sum(theta.^2);

%grad(1) = (1/m)*sum(X(:,1)'*(sigmoid(X*theta)-y));

%for i = 2:size(grad)
%   grad(i) = (1/m)*sum(X(:,i)'*(sigmoid(X*theta)-y))+(lambda/m)*grad(i);
%end

J=(-log(sigmoid(theta'*X'))*y-log(1-sigmoid(theta'*X'))*(1-y))/m+lambda*(theta(2:size(theta,1),1)'*theta(2:size(theta,1),1))/2/m;

grad(1,1)=X(:,1)'*(sigmoid(theta'*X')'-y)/m;

grad(2:size(theta,1),1)=X(:,2:size(theta,1))'*(sigmoid(theta'*X')'-y)/m+theta(2:size(theta,1),1)*lambda/m;

% =============================================================

end
