function loss = NST_objective(x0,p,a,alpha,beta,net,texture_layers,content_layers,...
            texture_weights,content_weights,texture_targets,content_targets)
        
if all(size(a) ~= size(p))
    disp('error: style and content source different size')
end
    
loss = alpha*texture_objective(x0,a,net,texture_layers,texture_targets,texture_weights) ...
            + beta*content_objective(x0,p,net,content_layers,content_targets,content_weights);