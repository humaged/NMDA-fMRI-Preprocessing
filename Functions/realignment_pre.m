       
        function realignment_pre(data_dir)
        realign_estimate_reslice = struct; % Creating a structure for the jobman
        files = spm_select('List',data_dir,'^fM','.img'); % Select all the files that starts with fM and ends with .img
        fs = cellstr([repmat([data_dir filesep], size(files,1), 1) files, repmat(',1',size(files,1),1)]); % Data formed in the SPM style

        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.data = {fs};
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = ''; 
        
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [0 1];
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
        realign_estimate_reslice.matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
        spm_jobman('run', realign_estimate_reslice.matlabbatch);