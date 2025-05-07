#!/bin/sh
#
module load NCO/5.1.3-hpc1-gcc-2022a-eb
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"

for run in 'Hist' 'Hist_SSP245' 'Hspu' 'Cfix' 'Cfx2'
do
if [ ${run} = 'Hspu' ]
then
  years='2279_2379'
  yr1='2279'
  yr2='2379'
elif [ ${run} = 'Cfix' ]
then
  years='1957_2057'
  yr1='1957'
  yr2='2057'
elif [ ${run} = 'Cfx2' ]
then
  years='1918_2018'
  yr1='1918'
  yr2='2018'
elif [ ${run} = 'Hist' ]
then
  years='1851_1981'
  yr1='1851'
  yr2='1981'
elif [ ${run} = 'Hist_SSP245' ]
then
  years='2070_2100'
  yr1='2070'
  yr2='2100'
fi

cd ${datadir}/Data/data_sensitivity/${run}/VTRP_DEP/

for kk in `seq 0 1`
do
cdo merge ${run}_${years}_GIN_East_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_East_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_GIN_East_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_GIN_West_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_West_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_GIN_West_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_GIN_North_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_North_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_North_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_GIN_South_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_South_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_South_ptrp_mtrp_dep_${kk}_v100-2000.nc

cdo merge ${run}_${years}_LAB_East_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_East_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_LAB_East_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_LAB_West_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_West_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_LAB_West_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_LAB_North_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_North_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_North_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_LAB_South_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_South_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_South_ptrp_mtrp_dep_${kk}_v100-2000.nc

cdo merge ${run}_${years}_IRMINGER_East_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_East_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_IRMINGER_East_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_IRMINGER_West_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_West_mtrp_dep_${kk}_v100-2000.nc   ${run}_${years}_IRMINGER_West_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_IRMINGER_North_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_North_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_North_ptrp_mtrp_dep_${kk}_v100-2000.nc
cdo merge ${run}_${years}_IRMINGER_South_ptrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_South_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_South_ptrp_mtrp_dep_${kk}_v100-2000.nc

cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_GIN_East_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_GIN_East_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_GIN_West_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_GIN_West_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_GIN_North_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_North_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_GIN_South_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_GIN_South_vtrp_dep_${kk}_v100-2000.nc

cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_LAB_East_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_LAB_East_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_LAB_West_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_LAB_West_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_LAB_North_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_North_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_LAB_South_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_LAB_South_vtrp_dep_${kk}_v100-2000.nc

cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_IRMINGER_East_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_IRMINGER_East_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_IRMINGER_West_ptrp_mtrp_dep_${kk}_v100-2000.nc  ${run}_${years}_IRMINGER_West_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_IRMINGER_North_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_North_vtrp_dep_${kk}_v100-2000.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_IRMINGER_South_ptrp_mtrp_dep_${kk}_v100-2000.nc ${run}_${years}_IRMINGER_South_vtrp_dep_${kk}_v100-2000.nc

done

rm ${run}_${years}_*_ptrp_mtrp_dep_${kk}_v100-2000.nc

done


exit
