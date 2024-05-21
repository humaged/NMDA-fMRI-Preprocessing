function coregister_pre(data_dir, source_dir) 
        coregister = struct; % Creating a structure for the jobman
        ref_file = spm_select('List',data_dir,'^m','.img'); % Select all the files that starts with m and ends with .img
        source_file = spm_select('List',source_dir,'^s','.img'); % Select all the files that starts with s and ends with .img
        ref_file_s = cellstr([repmat([data_dir filesep], size(ref_file,1), 1) ref_file, repmat(',1',size(ref_file,1),1)]);  % Data formed in the SPM style
        source_file_s = cellstr([repmat([source_dir filesep], size(source_file,1), 1) source_file, repmat(',1',size(source_file,1),1)]);  % Data formed in the SPM style
        
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.ref = ref_file_s;
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.source = source_file_s;
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
        coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
        spm_jobman('run', coregister.matlabbatch);