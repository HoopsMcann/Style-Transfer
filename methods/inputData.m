function out = inputData(x,net,layer)
%Compute the unactivated feature maps for all convolutional layers up to
%layer. The function expects layer to be of the form reluN_M.
%
% Inputs:
%        x              - Input to the network net
%        net            - CNN trained for image recognition 
%        layer          - The last layer used to define the content
%                         representation of x.
%
% Outputs:
%         out           - Cell array containing the feature map data for
%                         each layer in the network up to layer
L = layers_to_propagate_through(layer,net);
N = length(L);
out = cell(1,N);
for i=1:N
    out{i} = gpuArray(activations(net,x,L(i).name));
end
    