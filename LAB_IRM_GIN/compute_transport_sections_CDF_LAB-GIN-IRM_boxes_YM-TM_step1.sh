#!/bin/sh
#
module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb
module load NCO/5.1.3-hpc1-gcc-2022a-eb

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

cd ${datadir}/Data/data_sensitivity/${run}/

for zz in `seq 0 1`
do
  for kk in `seq 100 100 2000`
  do
  #east
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_East_transports.nc ATL_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_East_mtrp_dep_${zz}_vf.nc
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_East_transports.nc ATL_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_East_mtrp_dep_${zz}_vf.nc    
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_East_transports.nc ATL_${years}_depth_${kk}_IRMINGER_East_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_East_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_East_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_East_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_East_mtrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_East_transports.nc ATL_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_East_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_East_transports.nc ATL_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_East_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_East_transports.nc ATL_${years}_depth_${kk}_IRMINGER_East_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_East_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_East_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_East_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_East_ptrp_dep_${zz}_vf.nc
  #west
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_West_transports.nc ATL_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_West_mtrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_West_transports.nc ATL_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_West_ptrp_dep_${zz}_vf.nc
  #north
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_North_transports.nc ATL_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_North_mtrp_dep_${zz}_vf.nc
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_North_transports.nc ATL_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_North_mtrp_dep_${zz}_vf.nc
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_North_transports.nc ATL_${years}_depth_${kk}_IRMINGER_North_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_North_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_North_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_North_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_North_mtrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_North_transports.nc ATL_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_North_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_North_transports.nc ATL_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_North_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_North_transports.nc ATL_${years}_depth_${kk}_IRMINGER_North_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_North_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_North_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_North_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_North_ptrp_dep_${zz}_vf.nc
  #south
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_South_transports.nc ATL_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_South_mtrp_dep_${zz}_vf.nc
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_South_transports.nc ATL_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_South_mtrp_dep_${zz}_vf.nc
  ncks -v mtrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_South_transports.nc ATL_${years}_depth_${kk}_IRMINGER_South_mtrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_South_mtrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_South_mtrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_South_mtrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_South_mtrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_South_transports.nc ATL_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_GIN_South_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_South_transports.nc ATL_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_LAB_South_ptrp_dep_${zz}_vf.nc
  ncks -v ptrp_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRMINGER_South_transports.nc ATL_${years}_depth_${kk}_IRMINGER_South_ptrp_dep_${zz}_v0.nc
  ncks -C -O -x -v depth_class ATL_${years}_depth_${kk}_IRMINGER_South_ptrp_dep_${zz}_v0.nc ATL_${years}_depth_${kk}_IRMINGER_South_ptrp_dep_${zz}_v00.nc
  ncwa -a depth_class ATL_${years}_depth_${kk}_IRMINGER_South_ptrp_dep_${zz}_v00.nc ATL_${years}_depth_${kk}_IRMINGER_South_ptrp_dep_${zz}_vf.nc

mv *_vf.nc VTRP_DEP/
rm *_v0.nc *_v00.nc
  done
done
done
exit
