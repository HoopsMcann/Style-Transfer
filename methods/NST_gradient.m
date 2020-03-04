function gradient = NST_gradient(x0,p,a,alpha,beta,net,texture_layers,content_layers,...
            texture_weights,content_weights,texture_targets,content_targets)
        
text_grad = texture_grad(x0,a,net,texture_layers,texture_targets,texture_weights);

cont_grad = content_grad(x0,p,net,content_layers,content_targets,content_weights);

gradient = alpha*text_grad + beta*cont_grad;