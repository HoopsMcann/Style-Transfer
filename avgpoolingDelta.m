function out = avgpoolingDelta(d)
% All pooling layers are average pooling with a 2x2 window and 2x2 stride
%Inputs:
% d - deltas from convolution layer

[h, w , c] = size(d);
I = ones(2,2,'like',d);
out = reshape(kron(reshape((1/4)*d,h,w*c),I),2*h,2*w,c);
% out = zeros(2*h,2*w,c);
% for i=1:c
%     out(:,:,i) = kron((1/4)*d(:,:,i),I);
% end
