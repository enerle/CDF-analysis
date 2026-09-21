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

for cc in 'ptrp' 'mtrp'	
do
for kk in '1000' #'600' '800' '1000' '1500'
do
for zz in `seq 0 1`
do	
#LAB_East
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_East_transports.nc          ATL_${years}_depth_${kk}_LAB_East_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_LAB_East_${cc}_dep_${zz}_v0.nc   ATL_${years}_depth_${kk}_LAB_East_${cc}_dep_${zz}_v00.nc  
ncwa -a depth_class                   ATL_${years}_depth_${kk}_LAB_East_${cc}_dep_${zz}_v00.nc  ${run}_${years}_depth_${kk}_LAB_East_${cc}_dep_${zz}_vf.nc
#LAB_South
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_South_transports.nc         ATL_${years}_depth_${kk}_LAB_South_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_LAB_South_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_LAB_South_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_LAB_South_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_LAB_South_${cc}_dep_${zz}_vf.nc
#LAB_North
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_North_transports.nc         ATL_${years}_depth_${kk}_LAB_North_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_LAB_North_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_LAB_North_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_LAB_North_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_LAB_North_${cc}_dep_${zz}_vf.nc
#LAB_West
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_LAB_West_transports.nc          ATL_${years}_depth_${kk}_LAB_West_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_LAB_West_${cc}_dep_${zz}_v0.nc   ATL_${years}_depth_${kk}_LAB_West_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_LAB_West_${cc}_dep_${zz}_v00.nc  ${run}_${years}_depth_${kk}_LAB_West_${cc}_dep_${zz}_vf.nc
#
#IRM_East
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRM_East_transports.nc          ATL_${years}_depth_${kk}_IRM_East_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_IRM_East_${cc}_dep_${zz}_v0.nc   ATL_${years}_depth_${kk}_IRM_East_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_IRM_East_${cc}_dep_${zz}_v00.nc  ${run}_${years}_depth_${kk}_IRM_East_${cc}_dep_${zz}_vf.nc
#IRM_South
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_IRM_South_transports.nc         ATL_${years}_depth_${kk}_IRM_South_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_IRM_South_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_IRM_South_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_IRM_South_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_IRM_South_${cc}_dep_${zz}_vf.nc
#
#GIN_East
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_East_transports.nc          ATL_${years}_depth_${kk}_GIN_East_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_GIN_East_${cc}_dep_${zz}_v0.nc   ATL_${years}_depth_${kk}_GIN_East_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_GIN_East_${cc}_dep_${zz}_v00.nc  ${run}_${years}_depth_${kk}_GIN_East_${cc}_dep_${zz}_vf.nc
#GIN_South
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_South_1_transports.nc         ATL_${years}_depth_${kk}_GIN_South_1_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_GIN_South_1_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_GIN_South_1_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_GIN_South_1_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_GIN_South_1_${cc}_dep_${zz}_vf.nc
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_South_2_transports.nc         ATL_${years}_depth_${kk}_GIN_South_2_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_GIN_South_2_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_GIN_South_2_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_GIN_South_2_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_GIN_South_2_${cc}_dep_${zz}_vf.nc
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_South_transports.nc         ATL_${years}_depth_${kk}_GIN_South_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_GIN_South_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_GIN_South_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_GIN_South_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_GIN_South_${cc}_dep_${zz}_vf.nc
#GIN_North
ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_GIN_North_transports.nc         ATL_${years}_depth_${kk}_GIN_North_${cc}_dep_${zz}_v0.nc
ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_GIN_North_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_GIN_North_${cc}_dep_${zz}_v00.nc
ncwa -a depth_class                   ATL_${years}_depth_${kk}_GIN_North_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_GIN_North_${cc}_dep_${zz}_vf.nc
#
#OSNAP_East
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_OSNAP_East_transports.nc         ATL_${years}_depth_${kk}_OSNAP_East_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_OSNAP_East_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_OSNAP_East_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                   ATL_${years}_depth_${kk}_OSNAP_East_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_OSNAP_East_${cc}_dep_${zz}_vf.nc
#OSNAP_West
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_OSNAP_West_transports.nc         ATL_${years}_depth_${kk}_OSNAP_West_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_OSNAP_West_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_OSNAP_West_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                   ATL_${years}_depth_${kk}_OSNAP_West_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_OSNAP_West_${cc}_dep_${zz}_vf.nc
#
#SEC_70N
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_SEC_70N_transports.nc         ATL_${years}_depth_${kk}_SEC_70N_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class          ATL_${years}_depth_${kk}_SEC_70N_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_SEC_70N_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                   ATL_${years}_depth_${kk}_SEC_70N_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_trans70N_${cc}_dep_${zz}_vf.nc
#
#SEC_60N
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_SEC_60N_transports.nc         ATL_${years}_depth_${kk}_SEC_60N_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class           ATL_${years}_depth_${kk}_SEC_60N_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_SEC_60N_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                    ATL_${years}_depth_${kk}_SEC_60N_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_trans60N_${cc}_dep_${zz}_vf.nc
#SEC_45N
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_SEC_45N_transports.nc         ATL_${years}_depth_${kk}_SEC_45N_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class           ATL_${years}_depth_${kk}_SEC_45N_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_SEC_45N_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                    ATL_${years}_depth_${kk}_SEC_45N_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_trans45N_${cc}_dep_${zz}_vf.nc
#SEC_26N
#ncks -v ${cc}_dep -d depth_class,${zz} ATL_${years}_depth_${kk}_SEC_26N_transports.nc         ATL_${years}_depth_${kk}_SEC_26N_${cc}_dep_${zz}_v0.nc
#ncks -C -O -x -v depth_class           ATL_${years}_depth_${kk}_SEC_26N_${cc}_dep_${zz}_v0.nc  ATL_${years}_depth_${kk}_SEC_26N_${cc}_dep_${zz}_v00.nc
#ncwa -a depth_class                    ATL_${years}_depth_${kk}_SEC_26N_${cc}_dep_${zz}_v00.nc ${run}_${years}_depth_${kk}_trans26N_${cc}_dep_${zz}_vf.nc
done
done
mv *_vf.nc VTRP_DEP/
rm *_v0.nc *_v00.nc
done
done

exit
