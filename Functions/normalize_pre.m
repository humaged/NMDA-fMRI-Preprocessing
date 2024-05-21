function normalize_pre(data_dir, source_dir)
        normalize = struct; 
        files = spm_select('List',data_dir,'^fM','.img');
        fs_n = cellstr([repmat([data_dir filesep], size(files,1), 1) files, repmat(',1',size(files,1),1)]);
        def_file = spm_select('List',source_dir,'^y','.nii');
        def_n = cellstr([repmat([source_dir filesep], size(def_file,1), 1) def_file]);
        
        normalize.matlabbatch{1}.spm.spatial.normalise.write.subj.def = def_n;
        normalize.matlabbatch{1}.spm.spatial.normalise.write.subj.resample = fs_n;
        normalize.matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                                  78 76 85];
        normalize.matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
        normalize.matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
        normalize.matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';
        spm_jobman('run', normalize.matlabbatch);