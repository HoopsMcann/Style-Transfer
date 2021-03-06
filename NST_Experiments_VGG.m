 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%% Neural Style Transfer Experiments %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% VGG19 Tests
close all;

CNN = 'vgg'; % Network to use for NST

%Image Targets
style = 'images/polka_dots.jpg';
a = imread(style); %style source
a = imresize(a,[256,256]); %set image size

content = 'images/san-francisco.jpg';
p = imread(content); %content source
p = imresize(p,[256,256]); %set image size

%Target Parameters
content_layers = {'relu4_2'};
content_weights = 1e-04;
texture_layers = {'relu1_1','relu2_1','relu3_1','relu4_1'};
texture_weights = 1e-06*ones(1,length(texture_layers));

%Initalize Parmeter Structures
[x0,lb,ub,content_targets,texture_targets,net] = init(p,a,content_layers,texture_layers,CNN);

%Visualize content and style sources
figure()
subplot(1,2,1), imshow(a)
title('Style Source')
subplot(1,2,2), imshow(p)
title('Content Source')


%% Begin Optimization For NST

%Set Style and Content weights
alpha = 1e+00; %style 
beta = 40e+00; %content

fun = @(x) NST_objective(x,p,a,alpha,beta,net,texture_layers,content_layers,...
            texture_weights,content_weights,texture_targets,content_targets);
        
grad = @(x) NST_gradient(x,p,a,alpha,beta,net,texture_layers,content_layers,...
            texture_weights,content_weights,texture_targets,content_targets);

opts = optiset('solver','lbfgsb','display','iter','maxiter',1000,'tolrfun',1e-07,'maxtime',1e+06);
% Create OPTI Object
Opt = opti('fun',fun,'grad',grad,'bounds',lb,ub,'x0',x0(:),'options',opts);
% Solve!
tic
[x,fval,info] = solve(Opt);
toc


%% Visualize NST Result
close all;
dim = size(p);
x = reshape(x,dim(1),dim(2),dim(3));
x = cast(x,'uint8');
close all;
figure()
subplot(1,2,1), imshow(p)
title('Content Source')
subplot(1,2,2), imshow(x)
title('NST output')
