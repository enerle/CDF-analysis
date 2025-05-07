#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/post-processed_4/YM"
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

for zz in `seq 100 100 2000`
do 
echo ${run} ${zz}
../bin/cdftransport -pm -u ${datadir}/${run}_${years}_uo_yearmean_timmean.nc -v ${datadir}/${run}_${years}_vo_yearmean_timmean.nc -noheat -time 1 -zlimit ${zz} <section_labginirm.dat
rename -v ATL_ ATL_${years}_depth_${zz}_ ATL_*.nc
mv ATL_*.nc Data/data_sensitivity/${run} 
done

done
exit
