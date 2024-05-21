function estimation(class_dir);

    estimation = struct;
    estimation_file = spm_select('List',class_dir,'^S','.mat');
    estimation_fs = cellstr([repmat([class_dir filesep], size(estimation_file,1), 1) estimation_file]);

    estimation.matlabbatch{1}.spm.stats.fmri_est.spmmat = estimation_fs; 
    estimation.matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
    estimation.matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;


    spm_jobman('run', estimation.matlabbatch);
   