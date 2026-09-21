#!/bin/csh

module load netCDF-HDF5-utils/4.9.2-1.12.2-hpc1-intel-2023a-eb
module load Mambaforge/23.3.1-1-hpc1
mamba activate FERRET

set echo on

# depth, experiments and time ranges
set lev = 1000 #(600 800 1000 1500)
set run = (Hist Hspu Cfix Cfx2)
set yrs = (1851_2014 2241_2379 1917_2057 1885_2018)

# loop over depth levels
set z = 1
while ($z <= $#lev)

    set ZVL = $lev[$z]
    echo "=============================="
    echo "Processing depth ZVL = $ZVL"
    echo "=============================="

    # loop over experiments
    set i = 1
    while ($i <= $#run)

        set EXP = $run[$i]
        set YRS = $yrs[$i]

        echo "Processing EXP=$EXP  YRS=$YRS  ZVL=$ZVL"

        cd /nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS/analysis-HR/Data/data_dwfzt-test11sep/data_${EXP}/VTRP_DEP

        ferret << EOF

set mem/size=900

! ====================
!      LAB SECTION
! ====================
use ${EXP}_${YRS}_depth_${ZVL}_LAB_North_vtrp_dep_0_ym.nc !d1
use ${EXP}_${YRS}_depth_${ZVL}_LAB_South_vtrp_dep_0_ym.nc !d2
use ${EXP}_${YRS}_depth_${ZVL}_LAB_West_vtrp_dep_0_ym.nc  !d3
use ${EXP}_${YRS}_depth_${ZVL}_LAB_East_vtrp_dep_0_ym.nc  !d4
use ${EXP}_${YRS}_depth_${ZVL}_LAB_North_vtrp_dep_1_ym.nc !d5
use ${EXP}_${YRS}_depth_${ZVL}_LAB_South_vtrp_dep_1_ym.nc !d6
use ${EXP}_${YRS}_depth_${ZVL}_LAB_West_vtrp_dep_1_ym.nc  !d7
use ${EXP}_${YRS}_depth_${ZVL}_LAB_East_vtrp_dep_1_ym.nc  !d8

let north_top = VTRP_DEP[d=1]*(1.)
let south_top = VTRP_DEP[d=2]*(-1.)
let west_top  = VTRP_DEP[d=3]*(1.)
let east_top  = VTRP_DEP[d=4]*(-1.)

let north_bot = VTRP_DEP[d=5]*(1.)
let south_bot = VTRP_DEP[d=6]*(-1.)
let west_bot  = VTRP_DEP[d=7]*(1.)
let east_bot  = VTRP_DEP[d=8]*(-1.)

let net_top   = north_top + south_top + west_top + east_top
let net_bot   = north_bot + south_bot + west_bot + east_bot

save/file=${EXP}_${YRS}_LAB_dwf_z${ZVL}-v2.nc/clobber net_top, north_top, south_top, west_top, east_top
save/file=${EXP}_${YRS}_LAB_dwf_z${ZVL}-v2.nc/append  net_bot, north_bot, south_bot, west_bot, east_bot

! ====================
!      GIN SECTION
! ====================
use ${EXP}_${YRS}_depth_${ZVL}_GIN_North_vtrp_dep_0_ym.nc !d9
use ${EXP}_${YRS}_depth_${ZVL}_GIN_South_vtrp_dep_0_ym.nc !d10
use ${EXP}_${YRS}_depth_${ZVL}_GIN_East_vtrp_dep_0_ym.nc  !d11
use ${EXP}_${YRS}_depth_${ZVL}_GIN_North_vtrp_dep_1_ym.nc !d12
use ${EXP}_${YRS}_depth_${ZVL}_GIN_South_vtrp_dep_1_ym.nc !d13
use ${EXP}_${YRS}_depth_${ZVL}_GIN_East_vtrp_dep_1_ym.nc  !d14

let north_top = VTRP_DEP[d=9]*(1.)
let south_top = VTRP_DEP[d=10]*(-1.)
let east_top  = VTRP_DEP[d=11]*(1.)

let north_bot = VTRP_DEP[d=12]*(1.)
let south_bot = VTRP_DEP[d=13]*(-1.)
let east_bot  = VTRP_DEP[d=14]*(1.)

let net_top  = north_top + south_top  + east_top !!long section
let net_bot  = north_bot + south_bot  + east_bot

save/file=${EXP}_${YRS}_GIN_dwf_z${ZVL}-v2.nc/clobber net_top, north_top, south_top, east_top
save/file=${EXP}_${YRS}_GIN_dwf_z${ZVL}-v2.nc/append  net_bot, north_bot, south_bot, east_bot

! ====================
!      IRM SECTION
! ====================
use ${EXP}_${YRS}_depth_${ZVL}_IRM_South_vtrp_dep_0_ym.nc !d15
use ${EXP}_${YRS}_depth_${ZVL}_IRM_East_vtrp_dep_0_ym.nc  !d16
use ${EXP}_${YRS}_depth_${ZVL}_IRM_South_vtrp_dep_1_ym.nc !d17
use ${EXP}_${YRS}_depth_${ZVL}_IRM_East_vtrp_dep_1_ym.nc  !d18

let north_top = VTRP_DEP[d=10]*(1.)
let south_top = VTRP_DEP[d=15]*(-1.)
let west_top  = VTRP_DEP[d=4]*(1.)
let east_top  = VTRP_DEP[d=16]*(-1.)

let north_bot = VTRP_DEP[d=13]*(1.)
let south_bot = VTRP_DEP[d=17]*(-1.)
let west_bot  = VTRP_DEP[d=8]*(1.)
let east_bot  = VTRP_DEP[d=18]*(-1.)

let net_top  = north_top + south_top + west_top + east_top
let net_bot  = north_bot + south_bot + west_bot + east_bot 

save/file=${EXP}_${YRS}_IRM_dwf_z${ZVL}-v2.nc/clobber net_top, north_top, south_top, west_top, east_top
save/file=${EXP}_${YRS}_IRM_dwf_z${ZVL}-v2.nc/append  net_bot, north_bot, south_bot, west_bot, east_bot

exit
EOF

        /bin/rm -f ferret.jnl*

        @ i = $i + 1
    end

    @ z = $z + 1
end
