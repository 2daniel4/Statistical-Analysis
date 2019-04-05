#!/bin/tcsh

#For analysis of DTI imaging
#1.Must have fsl installed
#2.create design files with fsl's glm_gui
#3.Used for a Monte Carlo simulation with 5000 permutations


@ linenum = 1
set echo
cd /Volumes/DANIEL/dti_FDT_FA_freesurf/stats

randomise -i all_RD_skeletonised.nii.gz -o RD_paired -d design.mat -t design.con -m mean_FA_skeleton_mask.nii.gz -n 5000 -D --T2








