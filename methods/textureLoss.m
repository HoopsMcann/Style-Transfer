function out = textureLoss(F,targets,weights)

N = length(targets);
out = zeros(1,N);
for i=1:N
    [h,w,c] = size(F{i});
    fm_size = h*w;
    Feat_mat = reshape(F{i},fm_size,c)';
    G = Feat_mat*Feat_mat';
    out(i) = (1/(4*fm_size^2))*norm(G-targets{i},'fro').^2;
end
out = out*weights';