#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis-HR"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"

for run in 'Hist' 'Hspu' 'Cfix' 'Cfx2'
do
if [ ${run} = 'Hspu' ]
then
  years='2241_2379'
  yr1='2241'
  yr2='2379' 
elif [ ${run} = 'Cfix' ]
then
  years='1917_2057'
  yr1='1917'
  yr2='2057'
elif [ ${run} = 'Cfx2' ]
then
  years='1885_2018'
  yr1='1885'
  yr2='2018'
elif [ ${run} = 'Hist' ]
then
  years='1851_2014'
  yr1='1851'
  yr2='2014'
elif [ ${run} = 'Hist_SSP245' ]
then
  years='2015_2100'
  yr1='2015'
  yr2='2100'
elif [ ${run} = 'Cdio' ]
then
  years='1851_2056'
  yr1='1851'
  yr2='2056'
fi

cd ${datadir}/Data/data_dwfzt-test11sep/data_${run}/VTRP_DEP/

for kk in '1000' #'600' '800' '1000' '1500'
do
for zz in `seq 0 1`
do	

cdo merge ${run}_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_East_ptrp_mtrp_dep_${zz}_vf.nc 
cdo merge ${run}_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_South_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_North_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_West_ptrp_mtrp_dep_${zz}_vf.nc

cdo merge ${run}_${years}_depth_${kk}_IRM_East_ptrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_IRM_East_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_IRM_East_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_IRM_South_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_IRM_South_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_IRM_South_ptrp_mtrp_dep_${zz}_vf.nc

cdo merge ${run}_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_GIN_East_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_GIN_South_1_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_1_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_1_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_GIN_South_2_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_2_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_2_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_ptrp_mtrp_dep_${zz}_vf.nc
cdo merge ${run}_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_North_ptrp_mtrp_dep_${zz}_vf.nc

#cdo merge ${run}_${years}_depth_${kk}_OSNAP_East_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_East_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_East_ptrp_mtrp_dep_${zz}_vf.nc
#cdo merge ${run}_${years}_depth_${kk}_OSNAP_West_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_West_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_West_ptrp_mtrp_dep_${zz}_vf.nc
#
#cdo merge ${run}_${years}_depth_${kk}_trans70N_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans70N_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans70N_ptrp_mtrp_dep_${zz}_vf.nc
#cdo merge ${run}_${years}_depth_${kk}_trans60N_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans60N_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans60N_ptrp_mtrp_dep_${zz}_vf.nc
#cdo merge ${run}_${years}_depth_${kk}_trans45N_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans45N_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans45N_ptrp_mtrp_dep_${zz}_vf.nc
#cdo merge ${run}_${years}_depth_${kk}_trans26N_ptrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans26N_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans26N_ptrp_mtrp_dep_${zz}_vf.nc

cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_LAB_East_ptrp_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_East_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_LAB_South_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_South_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_LAB_North_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_LAB_North_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_LAB_West_ptrp_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_LAB_West_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_IRM_East_ptrp_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_IRM_East_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_IRM_South_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_IRM_South_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_GIN_East_ptrp_mtrp_dep_${zz}_vf.nc  ${run}_${years}_depth_${kk}_GIN_East_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_GIN_South_1_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_1_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_GIN_South_2_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_2_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_GIN_South_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_South_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_GIN_North_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_GIN_North_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_OSNAP_East_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_East_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_OSNAP_West_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_OSNAP_West_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_trans70N_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans70N_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_trans60N_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans60N_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_trans45N_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans45N_vtrp_dep_${zz}_ym.nc
#cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_depth_${kk}_trans26N_ptrp_mtrp_dep_${zz}_vf.nc ${run}_${years}_depth_${kk}_trans26N_vtrp_dep_${zz}_ym.nc

done
done

rm *_ptrp_mtrp_dep_*

done
#rm *vf.nc

exit
