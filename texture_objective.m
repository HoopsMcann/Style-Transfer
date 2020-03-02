function loss = texture_objective(x0,a,net,texture_layers,texture_targets,texture_weights)

% a - texture/style source
dim = size(a);
x0 = reshape(x0,dim(1),dim(2),dim(3));
F = featureMaps(x0,net, texture_layers);
loss = textureLoss(F,texture_targets,texture_weights);
