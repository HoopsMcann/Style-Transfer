function gradient = content_grad(x0,p,net,content_layers,content_targets,layer_weights)

dim = size(p);
x0 = reshape(x0,dim); %dim(1),dim(2),dim(3));
F = featureMaps(x0,net,content_layers);

%backpropagate for gradients
dEdF = errorGradients(F,content_targets);
X = inputData(x0,net,content_layers{end}); %unactivated feature maps for each layer in layers (needed for convolution delta)
N = length(content_layers);
dLdX = zeros(cat(2,size(x0),N),'gpuArray');
for i=1:N
    layers = layers_to_propagate_through(content_layers{i},net); %list of layers to compute deltas for
    dLdX(:,:,:,i) = Gradients(layers,gpuArray(dEdF{i}),X,net);
end
gradient = gather(sum(bsxfun(@times,dLdX,reshape(layer_weights,1,1,1,[])),4));
