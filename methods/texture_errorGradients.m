function out = texture_errorGradients(F,G,targets)

N = length(targets);
out = cell(1,N);
for i=1:N
    [h,w,c]= size(F{i});
    fm_size = h*w;
    mat_fm = reshape(F{i},fm_size,c); %transpose
    out{i} = reshape((1/fm_size^2).*(mat_fm*(G{i}-targets{i})),h,w,c);
end