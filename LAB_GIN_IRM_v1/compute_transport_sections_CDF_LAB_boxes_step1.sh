#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb
module load NCO/5.1.3-hpc1-gcc-2022a-eb

datadir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis"
cdfdir="/nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/bin"


#for run in 'Hist' 'Hist_SSP245' 'Hspu' 'Cfix' 'Cfx2'
for run in 'Cdio'
do
if [ ${run} = 'Hspu' ]
then
  years='2241_2379'
  yr1='2241' #2241
  yr2='2379' #2379
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
  yr1='2028' #'1851'
  yr2='2042'
fi

cd ${datadir}/Data/data_700_1000/data_${run}/
for yy in `seq $yr1 $yr2`
do
  for kk in `seq 1 12`
  do
    for zz in `seq 0 1`
    do
      #east
      ncks -v mtrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_East_transports.nc ATL_${yy}_month_${kk}_LAB_East_mtrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_East_mtrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_East_mtrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_East_mtrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_East_mtrp_dep_${zz}_vf.nc
      #west
      ncks -v mtrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_West_transports.nc ATL_${yy}_month_${kk}_LAB_West_mtrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_West_mtrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_West_mtrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_West_mtrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_West_mtrp_dep_${zz}_vf.nc
      #north
      ncks -v mtrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_North_transports.nc ATL_${yy}_month_${kk}_LAB_North_mtrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_North_mtrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_North_mtrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_North_mtrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_North_mtrp_dep_${zz}_vf.nc
      #south
      ncks -v mtrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_South_transports.nc ATL_${yy}_month_${kk}_LAB_South_mtrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_South_mtrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_South_mtrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_South_mtrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_South_mtrp_dep_${zz}_vf.nc
####
      ncks -v ptrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_East_transports.nc ATL_${yy}_month_${kk}_LAB_East_ptrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_East_ptrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_East_ptrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_East_ptrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_East_ptrp_dep_${zz}_vf.nc
      #west
      ncks -v ptrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_West_transports.nc ATL_${yy}_month_${kk}_LAB_West_ptrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_West_ptrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_West_ptrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_West_ptrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_West_ptrp_dep_${zz}_vf.nc
      #north
      ncks -v ptrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_North_transports.nc ATL_${yy}_month_${kk}_LAB_North_ptrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_North_ptrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_North_ptrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_North_ptrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_North_ptrp_dep_${zz}_vf.nc
      #south
      ncks -v ptrp_dep -d depth_class,${zz} ATL_${yy}_month_${kk}_LAB_South_transports.nc ATL_${yy}_month_${kk}_LAB_South_ptrp_dep_${zz}_v0.nc
      ncks -C -O -x -v depth_class ATL_${yy}_month_${kk}_LAB_South_ptrp_dep_${zz}_v0.nc ATL_${yy}_month_${kk}_LAB_South_ptrp_dep_${zz}_v00.nc
      ncwa -a depth_class ATL_${yy}_month_${kk}_LAB_South_ptrp_dep_${zz}_v00.nc ATL_${yy}_month_${kk}_LAB_South_ptrp_dep_${zz}_vf.nc
    done
  done
  mv *_vf.nc VTRP_DEP/
  rm *_v0.nc *_v00.nc
done

done
exit
