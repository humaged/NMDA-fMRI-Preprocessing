function specification(data_dir, class_dir);

    specification = struct; % creating the structure for the jobman

    matlabbatch{1}.spm.stats.fmri_spec.dir = {class_dir};
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'scans';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 7;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
    
    % Choosing and structuring the data
    specification_files = spm_select('List', data_dir, '^sw','.img');
    specfication_fs = cellstr([repmat([data_dir filesep], size(specification_files,1), 1) specification_files, repmat(',1',size(specification_files,1),1)]);
    
    % SPM job file code
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.scans = specfication_fs;
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.name = 'listening';
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.onset = [6
                                                          18
                                                          30
                                                          42
                                                          54
                                                          66
                                                          78];
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.duration = 6;
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.tmod = 0;
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.pmod = struct('name', {}, 'param', {}, 'poly', {});
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.cond.orth = 1;
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''};
    specification.matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
    specification.matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    specification.matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    specification.matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
    specification.matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
    specification.matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
    specification.matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
    specification.matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
    spm_jobman('run', specification.matlabbatch);
