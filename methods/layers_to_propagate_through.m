function out = layers_to_propagate_through(layer,net)
%Helper function to construct the names of the layers which need to be
%backpropagated through. This function is highly specific to the architecture of the
%network. It constructs a list of strings of the form 'convN_M' which match the 
%naming convention of the network. 



%L = num_layers(layer); 
out = struct([]);
out(1).name = net.Layers(1).Name;
out(1).index = 1;
idx = 2;
i=2;
str = net.Layers(i).Name;
while strcmp(str,layer) ~= 1
    if strcmp(str(1:4),'conv')
        out(idx).name = str;
        out(idx).index = i;
        idx = idx +1;
    end
    i=i+1;
    str = net.Layers(i).Name;
end
    
