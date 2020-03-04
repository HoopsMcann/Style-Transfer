# A Matlab Implementation of Neural Style Transfer
> Neural Style Transfer (NST) is an algorithm that creates an image by combining the stylistic features of a piece of artwork with the content features of a photograph. The defining characteristic of NST which sets it apart from other image stylization techniques is the use of Deep Neural Networks trained for image recognition. First derived in 2016 by Leon Gatys and Matthias Bethge, the algorthm uses a single neural network to extract and recombine the content of one image and the style of another. The original paper that describe the algorithm can be found [here](https://ui.adsabs.harvard.edu/abs/2015arXiv150806576G) 

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General Info
The goal of this project was to build a working implementation of the NST model that faithfully produced results equivalent to those shown in the original paper by Gatys et al. It was not a priority to create a user-friendly open source app for image stylization as many already exist. If you are looking for such an application, one of the best is given by https://github.com/jcjohnson/neural-style. Here, Justin Johnson provides a robust and efficient version of the style transfer algorithm and even implements many of the modifications that were added to the original algorithm after its release. 

One of the side-effects of working in Matlab is that we have to implement our own backpropagation pass. The reason for this is that the deep learning toolbox that comes installed with Matlab  only allows users to access gradients of an objective function that is a scalar function of the networks weights. This is an issue for style transfer applications as the objective we try to optimize is a function of the input of the network and the weights are fixed. Compare this to Tensorflow or Pytorch which can execute forward and backward passes of networks with arbitrary loss functions completely within their computational graphs. 


## Screenshots
 
  
 #### Results 
 Some outputs 
 
 <p align="center">
<img src="images/SFU_concorse.jpg" width="256" height="256" title="Content Source"> <img src="images/Starry_Night.jpg" width="256" height="256" title="Style Source"> <img src="images/NST_Vangoh_SFU_1000itr.jpg" width="256" height="256" title="Output"> 
</p>

<p align="center">
<img src="images/SFU_concorse.jpg" width="256" height="256" title="Content Source"> <img src="images/Composition7.jpg" width="256" height="256" title="Style Source"> <img src="images/NST_SFU512_1000itr.jpg" width="256" height="256" title="Output"> 
</p>

<p align="center">
<img src="images/SFU_concorse.jpg" width="256" height="256" title="Content Source"> <img src="images/Pablo.jpg" width="256" height="256" title="Style Source "> <img src="images/NST_Pablo_SFU512_1000itr.jpg" width="256" height="256" title="Output"> 
</p>

## Technologies
If you want to try and use this repository on you local machine you will need the following:
* Microsoft Visual Studio C++ - For MEX-file compilation
* Nvidia Cuda - For GPU execution
* [OPTI Toolbox](https://www.inverseproblem.co.nz/OPTI/index.php/Solvers/L-BFGS-B) - For L-BFGS-B optimization
* MatConvNet - Compiled with GPU support


## Setup
Describe how to install / setup your local environement / add link to demo version.

## Code Examples
Show examples of usage:
`put-your-code-here`

## Features
List of features ready and TODOs for future development
* Awesome feature 1
* Awesome feature 2
* Awesome feature 3

To-do list:
* Wow improvement to be done 1
* Wow improvement to be done 2

## Status
Project is: _in progress_, _finished_, _no longer continue_ and why?

## Inspiration
Add here credits. Project inspired by..., based on...

## Contact
Created by [@flynerdpl](https://www.flynerd.pl/) - feel free to contact me!
