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

  for yy in `seq $yr1 $yr2`
  do
    for mm in `seq 1 12`
    do
      mylist_east_mtrp+=(ATL_${yy}_month_${mm}_GIN_East_mtrp_dep_${zz}_vf.nc)
      mylist_west_mtrp+=(ATL_${yy}_month_${mm}_GIN_West_mtrp_dep_${zz}_vf.nc)
      mylist_north_mtrp+=(ATL_${yy}_month_${mm}_GIN_North_mtrp_dep_${zz}_vf.nc)
      mylist_south_mtrp+=(ATL_${yy}_month_${mm}_GIN_South_mtrp_dep_${zz}_vf.nc)

      mylist_east_ptrp+=(ATL_${yy}_month_${mm}_GIN_East_ptrp_dep_${zz}_vf.nc)
      mylist_west_ptrp+=(ATL_${yy}_month_${mm}_GIN_West_ptrp_dep_${zz}_vf.nc)
      mylist_north_ptrp+=(ATL_${yy}_month_${mm}_GIN_North_ptrp_dep_${zz}_vf.nc)
      mylist_south_ptrp+=(ATL_${yy}_month_${mm}_GIN_South_ptrp_dep_${zz}_vf.nc)
    done
 
    ncrcat ${mylist_east_mtrp[*]} ${run}_${yy}_GIN_East_mtrp_dep_${zz}.nc
    ncrcat ${mylist_west_mtrp[*]} ${run}_${yy}_GIN_West_mtrp_dep_${zz}.nc
    ncrcat ${mylist_north_mtrp[*]} ${run}_${yy}_GIN_North_mtrp_dep_${zz}.nc
    ncrcat ${mylist_south_mtrp[*]} ${run}_${yy}_GIN_South_mtrp_dep_${zz}.nc

    ncrcat ${mylist_east_ptrp[*]} ${run}_${yy}_GIN_East_ptrp_dep_${zz}.nc
    ncrcat ${mylist_west_ptrp[*]} ${run}_${yy}_GIN_West_ptrp_dep_${zz}.nc
    ncrcat ${mylist_north_ptrp[*]} ${run}_${yy}_GIN_North_ptrp_dep_${zz}.nc
    ncrcat ${mylist_south_ptrp[*]} ${run}_${yy}_GIN_South_ptrp_dep_${zz}.nc

    mylist_east_mtrp=()
    mylist_west_mtrp=()
    mylist_north_mtrp=()
    mylist_south_mtrp=()

    mylist_east_ptrp=()
    mylist_west_ptrp=()
    mylist_north_ptrp=()
    mylist_south_ptrp=()
  done
done
done

exit
