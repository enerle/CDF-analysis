#!/bin/sh
#
module load NCO/5.1.3-hpc1-gcc-2022a-eb
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"

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
  yr1='2015'
  yr2='2100'
elif [ ${run} = 'Cdio' ]
then
  years='1851_2042'
  yr1='1851'
  yr2='2042'
fi

cd ${datadir}/Data/data_700_1000/data_${run}/VTRP_DEP/

echo ------------------------------------------------------------
echo ${datadir}/Data/data_700_1000/data_${run}/VTRP_DEP/
echo ------------------------------------------------------------

for zz in `seq 0 1`
do

  mylist_east_mtrp=()
  mylist_west_mtrp=()
  mylist_north_mtrp=()
  mylist_south_mtrp=()
  
  mylist_east_ptrp=()
  mylist_west_ptrp=()
  mylist_north_ptrp=()
  mylist_south_ptrp=()

  for year in `seq $yr1 $yr2`
  do
    mylist_east_mtrp+=(${run}_${year}_LAB_East_mtrp_dep_${zz}_ym.nc)
    mylist_west_mtrp+=(${run}_${year}_LAB_West_mtrp_dep_${zz}_ym.nc)
    mylist_north_mtrp+=(${run}_${year}_LAB_North_mtrp_dep_${zz}_ym.nc)
    mylist_south_mtrp+=(${run}_${year}_LAB_South_mtrp_dep_${zz}_ym.nc)

    mylist_east_ptrp+=(${run}_${year}_LAB_East_ptrp_dep_${zz}_ym.nc)
    mylist_west_ptrp+=(${run}_${year}_LAB_West_ptrp_dep_${zz}_ym.nc)
    mylist_north_ptrp+=(${run}_${year}_LAB_North_ptrp_dep_${zz}_ym.nc)
    mylist_south_ptrp+=(${run}_${year}_LAB_South_ptrp_dep_${zz}_ym.nc)
  done

  ncecat ${mylist_east_mtrp[*]} ${run}_${years}_LAB_East_mtrp_dep_${zz}_ym.nc
  ncecat ${mylist_west_mtrp[*]} ${run}_${years}_LAB_West_mtrp_dep_${zz}_ym.nc
  ncecat ${mylist_north_mtrp[*]} ${run}_${years}_LAB_North_mtrp_dep_${zz}_ym.nc
  ncecat ${mylist_south_mtrp[*]} ${run}_${years}_LAB_South_mtrp_dep_${zz}_ym.nc

  ncecat ${mylist_east_ptrp[*]} ${run}_${years}_LAB_East_ptrp_dep_${zz}_ym.nc
  ncecat ${mylist_west_ptrp[*]} ${run}_${years}_LAB_West_ptrp_dep_${zz}_ym.nc
  ncecat ${mylist_north_ptrp[*]} ${run}_${years}_LAB_North_ptrp_dep_${zz}_ym.nc
  ncecat ${mylist_south_ptrp[*]} ${run}_${years}_LAB_South_ptrp_dep_${zz}_ym.nc

mylist_east_mtrp=()
mylist_west_mtrp=()
mylist_north_mtrp=()
mylist_south_mtrp=()
  
mylist_east_ptrp=()
mylist_west_ptrp=()
mylist_north_ptrp=()
mylist_south_ptrp=()

ncrename -h -O -d record,time ${run}_${years}_LAB_East_mtrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_West_mtrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_North_mtrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_South_mtrp_dep_${zz}_ym.nc

ncrename -h -O -d record,time ${run}_${years}_LAB_East_ptrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_West_ptrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_North_ptrp_dep_${zz}_ym.nc
ncrename -h -O -d record,time ${run}_${years}_LAB_South_ptrp_dep_${zz}_ym.nc

done  
done

exit
