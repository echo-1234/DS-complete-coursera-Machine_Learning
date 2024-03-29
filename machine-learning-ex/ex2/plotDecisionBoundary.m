function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.(only two variables)
%   2) MxN, N>3 matrix, where the first column is all-ones


% Plot Data
plotData(X(:,2:3), y);
hold on

%decision boundary is when theta' * X = 0 for logistic function

if size(X, 2) <= 3 
    % Only need 2 points to define a line, so choose two endpoints
    % find from the first varible 
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2]; 

    % Calculate the decision boundary line
    % calculate the corresponding value of the second variable according 
    % to criteria of theta(1)+theta(2)* X(i,2) + theta(3)* X(i,3) = 0;
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([30, 100, 30, 100])
else
    % Here is the grid range
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour

    % Plot z = 0
    % Notice you need to specify the range [0, 0]
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
