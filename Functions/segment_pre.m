        
function segment_pre(data_dir, source_dir) 


        segmentation = struct;
        source_file = spm_select('List',source_dir,'^s','.img');
        source_file_s = cellstr([repmat([source_dir filesep], size(source_file,1), 1) source_file, repmat(',1',size(source_file,1),1)]);


% Get all the different tpm files organized 
% There are 6 different priors in the tpm NIFTI file, for 6 different types of tissues in the brain.

        tpm_file_1 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_1s = cellstr([repmat([tpm_path filesep], size(tpm_file_1,1), 1) tpm_file_1, repmat(',1',size(tpm_file_1,1),1)]);
        % tpm_file_2
        tpm_file_2 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_2s = cellstr([repmat([tpm_path filesep], size(tpm_file_2,1), 1) tpm_file_2, repmat(',2',size(tpm_file_2,1),1)]);
        % tpm_file_3
        tpm_file_3 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_3s = cellstr([repmat([tpm_path filesep], size(tpm_file_3,1), 1) tpm_file_3, repmat(',3',size(tpm_file_3,1),1)]);
        %tpm_file_4
        tpm_file_4 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_4s = cellstr([repmat([tpm_path filesep], size(tpm_file_4,1), 1) tpm_file_4, repmat(',4',size(tpm_file_4,1),1)]);
        %tpm_file_5
        tpm_file_5 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_5s = cellstr([repmat([tpm_path filesep], size(tpm_file_5,1), 1) tpm_file_5, repmat(',5',size(tpm_file_5,1),1)]);
        %tpm_file_6
        tpm_file_6 = spm_select('List',tpm_path,'^T','.nii');
        tpm_file_6s = cellstr([repmat([tpm_path filesep], size(tpm_file_6,1), 1) tpm_file_6, repmat(',6',size(tpm_file_6,1),1)]);

        segmentation.matlabbatch{1}.spm.spatial.preproc.channel.vols = source_file_s;
        matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
        matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
        matlabbatch{1}.spm.spatial.preproc.channel.write = [0 1];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = tpm_file_1s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = tpm_file_2s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = tpm_file_3s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = tpm_file_4s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [1 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = tpm_file_5s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [1 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = tpm_file_6s;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.write = [0 1];
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
        segmentation.matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                                      NaN NaN NaN];
                spm_jobman('run', segmentation.matlabbatch);