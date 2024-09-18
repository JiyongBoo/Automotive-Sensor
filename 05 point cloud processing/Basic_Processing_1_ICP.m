%%  File Name: Search_Registration_05_given.m %%%%%%%%%%%%%%%%%%%%
%
%  Description: Registration of two point clouds using Iterative Closest Point (ICP)
%
%  Copyright 2019 MathWorks, Inc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
%% Align Two Point Clouds Using ICP Algorithm
% Load point cloud data.
ptCloud = pcread('teapot.ply');

pcshow(ptCloud); 
title('Teapot');

%%%%%%%%%% TODO %%%%%%%%%%
% Create a transform object with 30 degree rotation along z-axis and translation [5,5,10].
A = [cos(XXXX) sin(XXXX) 0 0; ...
    -sin(XXXX) cos(XXXX) 0 0; ...
            0      0 1 0; ...
            X      X X 1];
tform1 = affine3d(A);

% Transform the point cloud.
ptCloudTformed = pctransform(ptCloud,tform1);

pcshow(ptCloudTformed);
title('Transformed Teapot');

%%%%%%%%%% TODO %%%%%%%%%%
% Apply the rigid registration.
tform = pcregistericp(XXXXXXXXXXXXXX,XXXXXXX,'Extrapolate',true);

% Compare the result with the true transformation.
disp(tform1.T);

tform2 = invert(tform);
disp(tform2.T);
