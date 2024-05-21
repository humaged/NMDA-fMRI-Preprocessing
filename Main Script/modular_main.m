%% Function-based modular main code

% adding SPM 12
addpath(genpath([pwd,'/SPM12'])) %This ensures your SPM12 is loaded and running
spm ('defaults', 'fmri') %Initialization of spm defaults
spm ('initcfg')

% Vector indicating which steps should be performed
% v(1) = Realignment
% v(2) = Coregistration
% v(3) = Segmentation 
% v(4) = Normalization 
% v(5) = Smoothing 
v = [1,1,1,1,1]; 


%% Establishing directories where the data are
data_dir = '/Users/humagedemenli/Documents/data/MoAEpilot/fM00223'; % This is the directory of the fMRI .img files 
source_dir = '/Users/humagedemenli/Documents/data/MoAEpilot/sM00223'; % This is the directory of the source image for coregistration
tpm_path = '/Users/humagedemenli/Documents/MATLAB/SPM12/tpm'; % This is the directory for NIFTI files for segmentation
class_dir = '/Users/humagedemenli/Documents/data/auditory/classical'; % This is the directory for classical

%% Preprocessing
% Switch-case statements determine which jobs have to be executed 

%% Realignment 
clean matlabbatch 
switch v(1)
    case 1
        realignment_pre(data_dir);
    otherwise
end

%% Coregistration
switch v(2)
    case 1
        coregister_pre(data_dir, source_dir);
    otherwise
end

%% Segmentation
switch v(3)
    case 1

        segment_pre(tpm_path, source_dir);

    otherwise
end

%% Normalize 
switch v(4)
    case 1
        normalise_pre(data_dir, source_dir);
    otherwise
end

%% Smoothing
switch v(5)
    case 1
        smoothing_pre(data_dir);

    otherwise
end

%% Specification - first level analysis 

% Specify the folder you want to save the files to (your own auditory -
% classical folder)
specification(data_dir, class_dir);

%% Estimation

estimation(class_dir);