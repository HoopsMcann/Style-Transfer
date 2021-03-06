function gradient = texture_grad(x0,a,net,texture_layers,texture_targets,layer_weights)

dim = size(a);
x0 = reshape(x0,dim(1),dim(2),dim(3));
F = featureMaps(x0,net,texture_layers);
% Backpropagate 
dEdF = texture_errorGradients(F,Gram(F),texture_targets);
X = inputData(x0,net,texture_layers{end}); %unactivated feature maps for each layer in layers (needed for convolution delta)
N = length(texture_layers);
dLdX = zeros(cat(2,size(x0),N),'gpuArray');
for i=1:N
    layers = layers_to_propagate_through(texture_layers{i},net); %list of layers to compute deltas for
    dLdX(:,:,:,i) = Gradients(layers,gpuArray(dEdF{i}),X,net);
end
gradient = gather(sum(bsxfun(@times,dLdX,reshape(layer_weights,1,1,1,[])),4));
