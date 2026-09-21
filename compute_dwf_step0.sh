#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/post-processed/HR"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"

for run in 'Hspu' 'Cfix' 'Cfx2' 
do
if [ ${run} = 'Hspu' ]
then
  years='2241_2379'
  yr1='2359' #'2241'
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

for yy in `seq $yr1 $yr2`
do
for kk in '100' '200' '300' '400' '500' '600' '700' '800' '900' `seq 1100 100 2000` '3000' '4000' '5000'
  do 
  echo ${run} ${yy} ${kk}
  ../bin/cdftransport -pm -u ${datadir}/${run}/uo/${run}_${yy}0101_${yy}1231_uo_yearmean_v0.nc -v ${datadir}/${run}/vo/${run}_${yy}0101_${yy}1231_vo_yearmean_v0.nc -noheat -time 1 -zlimit ${kk} <sections_HR-test-19sep.dat
  ####<sections_HR.dat
  rename -v ATL_ ATL_${yy}_depth_${kk}_ ATL_*.nc
  #mv ATL_*.nc Data/data_dwfzt/data_${run}  #this is a test or our calculations 11sep26
  mv ATL_*.nc Data/data_dwfzt-test11sep/data_${run}
  done
done

done
exit
