#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/post-processed_4"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"

#for run in 'Hist' 'Hist_SSP245' 'Hspu' 'Cfix' 'Cfx2'
for run in 'Cdio'
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
  years='1851_2042'
  yr1='1969' #'1851'
  yr2='2042' #'1968'
fi

for yy in `seq $yr1 $yr2`
do
  for kk in `seq 1 12`
  do 
  echo ${run} ${yy} ${kk}
  ../bin/cdftransport -pm -u ${datadir}/${run}_${yy}0101_${yy}1231_uo_v0.nc -v ${datadir}/${run}_${yy}0101_${yy}1231_vo_v0.nc -noheat -time ${kk} -zlimit 700 <section_gin.dat
  rename -v ATL_ ATL_${yy}_month_${kk}_ ATL_*.nc
  mv ATL_*.nc Data/data_700_1000/data_${run} 
  done
done

done
exit
