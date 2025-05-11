#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb
module load NCO/5.1.3-hpc1-gcc-2022a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis/Data/data_700_1000/data_Cdio/VTRP_DEP/"
cd ${datadir}

for run in 'Cdio' #'Hist' 'Hist_SSP245' 'Hspu' 'Cfix' 'Cfx2'
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
  yr1='2033'
  yr2='2100'
elif [ ${run} = 'Cdio' ]
then
  years='1851_2042'
  yr1='1851'
  yr2='2042'
fi

cdo enssum ${run}_${years}_IRMINGER_North_vtrp_dep_0_ym.nc ${run}_${years}_GIN_South_vtrp_dep_0_ym.nc ${run}_${years}_IRMINGER_North_vtrp_dep_0_ym_v2.nc
cdo enssum ${run}_${years}_IRMINGER_North_vtrp_dep_1_ym.nc ${run}_${years}_GIN_South_vtrp_dep_1_ym.nc ${run}_${years}_IRMINGER_North_vtrp_dep_1_ym_v2.nc

#
done
exit
