function out = featureMaps(x,net,layers)
%Compute the activations induced by x for each of the layers in
%layers. Function expects entries in content_layers to be of the
%form reluN_M.
%
% Inputs:
%        x                  - Input to the network net.                
%        net                - CNN trained for image recognition
%        layers             - Layers to gather feature maps from.
%
% Output:
%        out                - Cell array containing the activations for
%                             each of the layers in content_layers.                           
N = length(layers);
F = cell(1,N);
for i = 1:N
    F{i} = activations(net,x,layers{i});
end
out = F;