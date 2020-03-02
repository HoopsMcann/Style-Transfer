function [x0,lb,ub,content_targets,texture_targets,net] = init(p,a,content_layers,texture_layers,CNN)

if strcmp(CNN,'vgg')
    net = vgg19;
    net = replace_maxpool(net);
end

if strcmp(CNN,'cifar')
    load('avgVGG');
    net = cifarAvgnet;
end
dim = size(a);
x0 = zeros(dim);
lb = zeros(dim(1)*dim(2),3);
ub = zeros(size(lb));
for i = 1:3
    minp = min(min(a(:,:,i)));
    maxp = max(max(a(:,:,i)));
    x0(:,:,i) = randi([minp,maxp],dim(1),dim(2));
    lb(:,i) = double(minp)*ones(dim(1)*dim(2),1);
    ub(:,i) = double(maxp)*ones(dim(1)*dim(2),1);
end
lb=lb(:);
ub=ub(:);
content_targets = featureMaps(p,net,content_layers);
texture_targets = Gram(featureMaps(a,net,texture_layers));