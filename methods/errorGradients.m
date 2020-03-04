function out = errorGradients(F,targets)
%Compute the derivative dE/dF for the error E. 
%
% Inputs:
%        F              - Cell containing feature activations for the
%                         content to be generated.
%        targets        - Cell containing feature activations for the
%                         target content.
%
% Outputs:
%         out           - Cell with entries dE/dF for each pair of
%                         activations.
N = length(targets);
out = cell(1,N);
for i=1:N
    out{i} = F{i}-targets{i};
end