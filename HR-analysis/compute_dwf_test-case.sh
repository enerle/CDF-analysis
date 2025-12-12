#!/bin/sh
# test-case

module load CDO/2.3.0-eccodes-aec-cmor-hpc1-intel-2023a-eb
module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb

run="Hist"
yr1="1851"
zz="1000"

../bin/cdftransport -pm -u ${run}_${yy}0101_${yy}1231_uo_yearmean_v0.nc -v ${run}_${yy}0101_${yy}1231_vo_yearmean_v0.nc -noheat -time 1 -zlimit ${kk} <sections.dat

exit
