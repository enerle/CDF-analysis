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

cd ${datadir}/Data/data_dwfzt-test11sep/data_${run}

for kk in '1000' #'600' '800' '1000' '1500'
do

echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo ${run} depth ${kk}
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#cdo cat ATL_*_depth_${kk}_LAB_East_transports.nc  ATL_${years}_depth_${kk}_LAB_East_transports.nc   
#cdo cat ATL_*_depth_${kk}_LAB_South_transports.nc ATL_${years}_depth_${kk}_LAB_South_transports.nc
#cdo cat ATL_*_depth_${kk}_LAB_North_transports.nc ATL_${years}_depth_${kk}_LAB_North_transports.nc
#cdo cat ATL_*_depth_${kk}_LAB_West_transports.nc  ATL_${years}_depth_${kk}_LAB_West_transports.nc

#cdo cat ATL_*_depth_${kk}_IRM_East_transports.nc  ATL_${years}_depth_${kk}_IRM_East_transports.nc
#cdo cat ATL_*_depth_${kk}_IRM_South_transports.nc ATL_${years}_depth_${kk}_IRM_South_transports.nc

#cdo cat ATL_*_depth_${kk}_GIN_East_transports.nc    ATL_${years}_depth_${kk}_GIN_East_transports.nc
#cdo cat ATL_*_depth_${kk}_GIN_South_1_transports.nc ATL_${years}_depth_${kk}_GIN_South_1_transports.nc
#cdo cat ATL_*_depth_${kk}_GIN_South_2_transports.nc ATL_${years}_depth_${kk}_GIN_South_2_transports.nc
cdo cat ATL_*_depth_${kk}_GIN_South_transports.nc   ATL_${years}_depth_${kk}_GIN_South_transports.nc
#cdo cat ATL_*_depth_${kk}_GIN_North_transports.nc   ATL_${years}_depth_${kk}_GIN_North_transports.nc
#
#cdo cat ATL_*_depth_${kk}_OSNAP_West_transports.nc ATL_${years}_depth_${kk}_OSNAP_West_transports.nc
#cdo cat ATL_*_depth_${kk}_OSNAP_East_transports.nc ATL_${years}_depth_${kk}_OSNAP_East_transports.nc
#cdo cat ATL_*_depth_${kk}_SEC_70N_transports.nc    ATL_${years}_depth_${kk}_SEC_70N_transports.nc
#cdo cat ATL_*_depth_${kk}_SEC_60N_transports.nc    ATL_${years}_depth_${kk}_SEC_60N_transports.nc
#cdo cat ATL_*_depth_${kk}_SEC_45N_transports.nc    ATL_${years}_depth_${kk}_SEC_45N_transports.nc
#cdo cat ATL_*_depth_${kk}_SEC_26N_transports.nc    ATL_${years}_depth_${kk}_SEC_26N_transports.nc

done

done
exit
