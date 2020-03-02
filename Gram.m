function out = Gram(F)
%Compute the gram matrices for the feature maps in F. The function expects
%F to be a cell array that contains 3d arrays of varying size.
%
% Inputs: 
%        F              - Feature maps for different layers in network
%
% Output:
%        out            - Gram matrix for each F{i} in F.


N=length(F);
out = cell(1,N);
for i=1:N
    [h,w,c] = size(F{i});
    fm_size = h*w;
    Feat_mat = reshape(F{i},fm_size,c)';
    out{i} = Feat_mat*Feat_mat';
end