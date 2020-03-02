function out = contentLoss(F,content_targets,content_weights)

L = length(content_targets);
out = zeros(1,L);
for i = 1:L
    N = size(F{i},3);
    fm_size = size(F{i},1)*size(F{i},2);
    target_activations = reshape(content_targets{i},fm_size,N);
    activations = reshape(F{i},fm_size,N);
    out(i) = 0.5*norm(activations - target_activations,'fro').^2;
end
out = out*content_weights';