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

echo ------------------------------------------------------------
echo ${datadir}/data_sensitivity/${run}/VTRP_DEP/
echo ------------------------------------------------------------

for kk in `seq 0 1`
do
  mylist_GIN_east_mtrp=()
  mylist_GIN_west_mtrp=()
  mylist_GIN_north_mtrp=()
  mylist_GIN_south_mtrp=()
  mylist_GIN_east_ptrp=()
  mylist_GIN_west_ptrp=()
  mylist_GIN_north_ptrp=()
  mylist_GIN_south_ptrp=()

  mylist_LAB_east_mtrp=()
  mylist_LAB_west_mtrp=()
  mylist_LAB_north_mtrp=()
  mylist_LAB_south_mtrp=()
  mylist_LAB_east_ptrp=()
  mylist_LAB_west_ptrp=()
  mylist_LAB_north_ptrp=()
  mylist_LAB_south_ptrp=()

  mylist_IRMINGER_east_mtrp=()
  mylist_IRMINGER_west_mtrp=()
  mylist_IRMINGER_north_mtrp=()
  mylist_IRMINGER_south_mtrp=()
  mylist_IRMINGER_east_ptrp=()
  mylist_IRMINGER_west_ptrp=()
  mylist_IRMINGER_north_ptrp=()
  mylist_IRMINGER_south_ptrp=()

for zz in `seq 100 100 2000`
    do
      mylist_GIN_east_mtrp+=(ATL_${years}_depth_${zz}_GIN_East_mtrp_dep_${kk}_vf.nc)
      mylist_GIN_west_mtrp+=(ATL_${years}_depth_${zz}_GIN_West_mtrp_dep_${kk}_vf.nc)
      mylist_GIN_north_mtrp+=(ATL_${years}_depth_${zz}_GIN_North_mtrp_dep_${kk}_vf.nc)
      mylist_GIN_south_mtrp+=(ATL_${years}_depth_${zz}_GIN_South_mtrp_dep_${kk}_vf.nc)
      mylist_GIN_east_ptrp+=(ATL_${years}_depth_${zz}_GIN_East_ptrp_dep_${kk}_vf.nc)
      mylist_GIN_west_ptrp+=(ATL_${years}_depth_${zz}_GIN_West_ptrp_dep_${kk}_vf.nc)
      mylist_GIN_north_ptrp+=(ATL_${years}_depth_${zz}_GIN_North_ptrp_dep_${kk}_vf.nc)
      mylist_GIN_south_ptrp+=(ATL_${years}_depth_${zz}_GIN_South_ptrp_dep_${kk}_vf.nc)
      
      mylist_LAB_east_mtrp+=(ATL_${years}_depth_${zz}_LAB_East_mtrp_dep_${kk}_vf.nc)
      mylist_LAB_west_mtrp+=(ATL_${years}_depth_${zz}_LAB_West_mtrp_dep_${kk}_vf.nc)
      mylist_LAB_north_mtrp+=(ATL_${years}_depth_${zz}_LAB_North_mtrp_dep_${kk}_vf.nc)
      mylist_LAB_south_mtrp+=(ATL_${years}_depth_${zz}_LAB_South_mtrp_dep_${kk}_vf.nc)
      mylist_LAB_east_ptrp+=(ATL_${years}_depth_${zz}_LAB_East_ptrp_dep_${kk}_vf.nc)
      mylist_LAB_west_ptrp+=(ATL_${years}_depth_${zz}_LAB_West_ptrp_dep_${kk}_vf.nc)
      mylist_LAB_north_ptrp+=(ATL_${years}_depth_${zz}_LAB_North_ptrp_dep_${kk}_vf.nc)
      mylist_LAB_south_ptrp+=(ATL_${years}_depth_${zz}_LAB_South_ptrp_dep_${kk}_vf.nc)

      mylist_IRMINGER_east_mtrp+=(ATL_${years}_depth_${zz}_IRMINGER_East_mtrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_west_mtrp+=(ATL_${years}_depth_${zz}_IRMINGER_West_mtrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_north_mtrp+=(ATL_${years}_depth_${zz}_IRMINGER_North_mtrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_south_mtrp+=(ATL_${years}_depth_${zz}_IRMINGER_South_mtrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_east_ptrp+=(ATL_${years}_depth_${zz}_IRMINGER_East_ptrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_west_ptrp+=(ATL_${years}_depth_${zz}_IRMINGER_West_ptrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_north_ptrp+=(ATL_${years}_depth_${zz}_IRMINGER_North_ptrp_dep_${kk}_vf.nc)
      mylist_IRMINGER_south_ptrp+=(ATL_${years}_depth_${zz}_IRMINGER_South_ptrp_dep_${kk}_vf.nc)
    done
    ncrcat ${mylist_GIN_east_mtrp[*]} ${run}_${years}_GIN_East_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_west_mtrp[*]} ${run}_${years}_GIN_West_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_north_mtrp[*]} ${run}_${years}_GIN_North_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_south_mtrp[*]} ${run}_${years}_GIN_South_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_east_ptrp[*]} ${run}_${years}_GIN_East_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_west_ptrp[*]} ${run}_${years}_GIN_West_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_north_ptrp[*]} ${run}_${years}_GIN_North_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_GIN_south_ptrp[*]} ${run}_${years}_GIN_South_ptrp_dep_${kk}_v100-2000.nc

    ncrcat ${mylist_LAB_east_mtrp[*]} ${run}_${years}_LAB_East_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_west_mtrp[*]} ${run}_${years}_LAB_West_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_north_mtrp[*]} ${run}_${years}_LAB_North_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_south_mtrp[*]} ${run}_${years}_LAB_South_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_east_ptrp[*]} ${run}_${years}_LAB_East_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_west_ptrp[*]} ${run}_${years}_LAB_West_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_north_ptrp[*]} ${run}_${years}_LAB_North_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_LAB_south_ptrp[*]} ${run}_${years}_LAB_South_ptrp_dep_${kk}_v100-2000.nc

    ncrcat ${mylist_IRMINGER_east_mtrp[*]} ${run}_${years}_IRMINGER_East_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_west_mtrp[*]} ${run}_${years}_IRMINGER_West_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_north_mtrp[*]} ${run}_${years}_IRMINGER_North_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_south_mtrp[*]} ${run}_${years}_IRMINGER_South_mtrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_east_ptrp[*]} ${run}_${years}_IRMINGER_East_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_west_ptrp[*]} ${run}_${years}_IRMINGER_West_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_north_ptrp[*]} ${run}_${years}_IRMINGER_North_ptrp_dep_${kk}_v100-2000.nc
    ncrcat ${mylist_IRMINGER_south_ptrp[*]} ${run}_${years}_IRMINGER_South_ptrp_dep_${kk}_v100-2000.nc

  mylist_GIN_east_mtrp=()
  mylist_GIN_west_mtrp=()
  mylist_GIN_north_mtrp=()
  mylist_GIN_south_mtrp=()
  mylist_GIN_east_ptrp=()
  mylist_GIN_west_ptrp=()
  mylist_GIN_north_ptrp=()
  mylist_GIN_south_ptrp=()

  mylist_LAB_east_mtrp=()
  mylist_LAB_west_mtrp=()
  mylist_LAB_north_mtrp=()
  mylist_LAB_south_mtrp=()
  mylist_LAB_east_ptrp=()
  mylist_LAB_west_ptrp=()
  mylist_LAB_north_ptrp=()
  mylist_LAB_south_ptrp=()

  mylist_IRMINGER_east_mtrp=()
  mylist_IRMINGER_west_mtrp=()
  mylist_IRMINGER_north_mtrp=()
  mylist_IRMINGER_south_mtrp=()
  mylist_IRMINGER_east_ptrp=()
  mylist_IRMINGER_west_ptrp=()
  mylist_IRMINGER_north_ptrp=()
  mylist_IRMINGER_south_ptrp=()
  done
done
exit
