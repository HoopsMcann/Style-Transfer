function out = replace_maxpool(net)
% Helper function to replace the max pooling layers in vgg19 with average
% pooling layers.

%create layer graph
net_lg = layerGraph(net.Layers);
%vgg16 has 5 pooling layers
for i=1:5
    name = strcat('pool',num2str(i));
    l_array = averagePooling2dLayer(2,'Stride',2,'Name',name);
    net_lg = replaceLayer(net_lg,name,l_array);
end
%l_array = imageInputLayer([224,224,3],'Name','input','Normalization','none');
%net_lg = replaceLayer(net_lg,'input',l_array);
out = assembleNetwork(net_lg);