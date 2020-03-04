function out = Gradients(layers,dEdF,X,net)
%Compute the derivative dEdX using backpropagation.
%
% Inputs:
%        layers         - Layers to backpropagate through. Struct object
%                         with fields: name, index.
%        dEdF           - Error gradient from the top layer.
%        X              - Unit inputs
%
% Output:
%        out            - The derivative dEdX with respect to layer l.
N = length(layers);
%d_old = dEdF.*dRelu(X{N});
d_old = bsxfun(@times,dEdF,dRelu(X{N}));
i = N-1; 
while i > 1
    [m1,m2] = size(X{i});
    [n1,n2] = size(d_old);
    W = gpuArray(net.Layers(layers(i+1).index).Weights);
    W = permute(rot90(W,2),[1,2,4,3]);    
    if all([m1,m2] == [n1,n2])
        %d_new = convDelta_vectorized(net.Layers(layers(i+1).index).Weights, d_old, X{i},'relu');
        d_new = bsxfun(@times,vl_nnconv(d_old,W,[],'Pad',1,'CudnnWorkspaceLimit',+inf),dRelu(X{i}));
    else
        d_old = avgpoolingDelta(d_old);
        %d_new = convDelta_vectorized(net.Layers(layers(i+1).index).Weights,d_old,X{i},'relu');
        %size(X{i})
        %size(d_old)
        %size(vl_nnconv(d_old,W,[],'Pad',1,'CudnnWorkspaceLimit',+inf))
        d_new = bsxfun(@times,vl_nnconv(d_old,W,[],'Pad',1,'CudnnWorkspaceLimit',+inf),dRelu(X{i}));
    end
    d_old = d_new;
    i = i-1;
end
W = gpuArray(net.Layers(layers(i+1).index).Weights);
W = permute(rot90(W,2),[1,2,4,3]);
out = vl_nnconv(d_old,W,[],'Pad',1,'CudnnWorkspaceLimit',+inf);

