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
  years='1851_1968'
  yr1='1851'
  yr2='1968'
fi

cd ${datadir}/Data/data_26n/${run}/VTRP_DEP/

for zz in `seq 0 1`
do

cdo merge ${run}_${years}_Atlantic_26N_WBC_ptrp_dep_${zz}_ym.nc ${run}_${years}_Atlantic_26N_WBC_mtrp_dep_${zz}_ym.nc   ${run}_${years}_Atlantic_26N_WBC_ptrp_mtrp_dep_${zz}_ym.nc
cdo merge ${run}_${years}_Atlantic_26N_INT_ptrp_dep_${zz}_ym.nc ${run}_${years}_Atlantic_26N_INT_mtrp_dep_${zz}_ym.nc   ${run}_${years}_Atlantic_26N_INT_ptrp_mtrp_dep_${zz}_ym.nc

cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_Atlantic_26N_WBC_ptrp_mtrp_dep_${zz}_ym.nc  ${run}_${years}_Atlantic_26N_WBC_vtrp_dep_${zz}_ym.nc
cdo aexpr,'vtrp_dep=ptrp_dep+mtrp_dep' ${run}_${years}_Atlantic_26N_INT_ptrp_mtrp_dep_${zz}_ym.nc  ${run}_${years}_Atlantic_26N_INT_vtrp_dep_${zz}_ym.nc

done

rm ${run}_${years}_Atlantic_26N_WBC_*_ptrp_mtrp_dep_${zz}_ym.nc

done


exit
