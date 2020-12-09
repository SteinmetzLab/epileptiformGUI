

% Sessions with linearity test, from Dan: 

% DPR_0009 2020-12-01 fullfieldContrastCheckerboard
% ZYE_0019 2020-12-01 fullfieldContrastCheckerboard
% ZYE_0018 2020-11-17 fullfieldContrastCheckerboard
% ZYE_0014 2020-10-28 fullfieldContrastCheckerboard
% DPR_0011 2020-10-28 fullfieldContrastCheckerboard
% ZYE_0012 2020-10-16 fullfieldContrastCheckerboard
% ZYE_0012 2020-10-16 fullfieldContrastCheckerboard
% SM_0001 2020-09-29 fullfieldContrastCheckerboard
% ZYE_0010 2020-09-15 fullfieldContrastCheckerboard
% NS_0005 2020-09-11 fullfieldContrastCheckerboard
% DPR_0009 2020-09-11 fullfieldContrastCheckerboard
% ZYE_0011 2020-09-11 fullfieldContrastCheckerboard
% DPR_0005 2020-09-08 fullfieldContrastCheckerboard
% DPR_0008 2020-09-02 fullfieldContrastCheckerboard
% NS_0005 2020-09-02 fullfieldContrastCheckerboard
% DPR_0008 2020-09-01 fullfieldContrastCheckerboard
% DPR_0008 2020-08-31 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-31 fullfieldContrastCheckerboard
% ZYE_0010 2020-08-30 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-30 fullfieldContrastCheckerboard
% DPR_0008 2020-08-30 fullfieldContrastCheckerboard
% DPR_0008 2020-08-29 fullfieldContrastCheckerboard
% ZYE_0010 2020-08-18 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-18 fullfieldContrastCheckerboard
% ZYE_0010 2020-08-17 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-17 fullfieldContrastCheckerboard
% ZYE_0010 2020-08-16 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-16 fullfieldContrastCheckerboard
% ZYE_0010 2020-08-15 fullfieldContrastCheckerboard
% ZYE_0009 2020-08-15 fullfieldContrastCheckerboard
% DPR_0005 2020-08-12 fullfieldContrastCheckerboard
% DPR_0006 2020-08-05 fullfieldContrastCheckerboard
% DPR_0004 2020-07-28 fullfieldContrastCheckerboard
% DPR_0004 2020-07-28 fullfieldContrastCheckerboard
% DPR_0004 2020-07-28 fullfieldContrastCheckerboard
% DPR_0004 2020-07-28 fullfieldContrastCheckerboard
% DPR_0004 2020-07-20 fullfieldContrastCheckerboard_varSize
% DPR_0004 2020-07-20 fullfieldContrastCheckerboard
% ZYE_0005 2020-07-08 fullfieldContrastCheckerboard
% ZYE_0003 2020-06-26 fullfieldContrastCheckerboard
% ZYE_0003 2020-06-25 fullfieldContrastCheckerboard
% ZYE_0003 2020-06-25 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-24 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-24 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-24 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-24 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-24 fullfieldContrastCheckerboard
% ZYE_0005 2020-06-23 fullfieldContrastCheckerboard
% ZYE_0004 2020-06-23 fullfieldContrastCheckerboard
% ZYE_0003 2020-06-23 fullfieldContrastCheckerboard
% ZYE_0003 2020-06-19 fullfieldContrastCheckerboard

%% paths
addpath(genpath(fullfile(githubDir, 'widefield')))
addpath(genpath(fullfile(githubDir, 'epileptiformGUI')))

%% load a session

mn = 'ZYE_0018';
td = '2020-11-17';
en = 1;

%%

mn = 'AD_0010';
td = '2020-03-06';
en = 5;

%%
mn = 'AD_0011';
td = '2020-06-03';
en = 2;
serverRoot = expPath(mn, td, en);

colors = {'blue', 'violet'};
computeWidefieldTimestamps(serverRoot, colors);

%%
mn = 'AD_0011';
td = '2020-05-15';
en = 2;

%%
mn = 'NS_0005';
td = '2020-07-23';
en = 1;
% just a couple events
% time 650, vis ctx - this is one

%% AD_0006\2019-12-13\5
mn = 'AD_0006';
td = '2019-12-13';
en = 5;

%% call the GUI

nSV = 500;


serverRoot = expPath(mn, td, en);

[U, V, t, mimg] = loadUVt(serverRoot, nSV);


epileptiformGUI(U, V, t, mimg); 
