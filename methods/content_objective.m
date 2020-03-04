function loss = content_objective(x0,p,net,content_layers,content_targets,content_weights)

dim = size(p);
x0 = reshape(x0,dim); %dim(1),dim(2),dim(3));
F = featureMaps(x0,net,content_layers);
loss = contentLoss(F,content_targets,content_weights);

% if (nargout>1)
%     dEdF = errorGradients(F,content_targets);
%     X = inputData(x0,net,content_layers{end}); %unactivated feature maps for each layer in layers (needed for convolution delta)
%     N = length(content_layers);
%     dLdX = zeros(cat(2,size(x0),N));
%     for i=1:N
%         layers = layers_to_propagate_through(content_layers{i},net); %list of layers to compute deltas for
%         dLdX(:,:,:,i) = Gradients(layers,dEdF{i},X,net);
%     end
%     gradient = sum(bsxfun(@times,dLdX,reshape(content_weights,1,1,1,[])),4);
%     %n = norm(gradient(:),2);
%     %disp(n)
% end
% E = contentErrors(F,content_targets);
% loss = E*layer_weights';