function smoothing_pre(data_dir)   

        smooth = struct; 
        files_w = spm_select('List',data_dir,'^wf','.img');
        fs_w = cellstr([repmat([data_dir filesep], size(files_w,1), 1) files_w, repmat(',1',size(files_w,1),1)]);
          
        smooth.matlabbatch{1}.spm.spatial.smooth.data = fs_w;
        smooth.matlabbatch{1}.spm.spatial.smooth.fwhm = [6 6 6];
        smooth.matlabbatch{1}.spm.spatial.smooth.dtype = 0;
        smooth.matlabbatch{1}.spm.spatial.smooth.im = 0;
        smooth.matlabbatch{1}.spm.spatial.smooth.prefix = 's';
        spm_jobman('run', smooth.matlabbatch);