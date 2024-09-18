%%  File Name: MATLAB_Basic_02_given.m %%%%%%%%%%%%%%%%%%%%
%
%  Description: Remove invalid points from point cloud.
%              
%
%  Copyright 2019 MathWorks, Inc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all;
%% Create a point cloud object with NaN and Inf values.
xyzpoints = abs(randn(10,3)).*100;
xyzpoints(1:2:4,:) = nan('single');
xyzpoints(6:2:10,:) = inf('single');

%%%%%%%%%% TODO %%%%%%%%%%
% Create point cloud object using XYZ points.
ptCloud = pointCloud(XXXXXXXXX); 

% Inspect the Location property of point cloud data to verify the occurrence of NaN and Inf values.
ptCloud.Location

%%%%%%%%%% TODO %%%%%%%%%%
% Remove points with NaN and Inf values from the point cloud.
ptCloudOut = removeInvalidPoints(XXXXXXXXX);

% Inspect the Location property of point cloud data to verify that the invalid points are removed.
ptCloudOut.Location