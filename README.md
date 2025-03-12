# CDF-analysis
Workflow for ocean mass transports estimation using EC-Earth HR Simulations and CDF tools 

## EC-Earth HR Simulations 

**Main directory**

    /nobackup/rossby26/proj/rossby/joint_exp/ligarctic/EC-Earth3-HR_runs

**Simulations**

    Hspu: 350-yr Pre-Industrial (PrI) for 1850
    Hist: Historical (1850-2014) starts from year ~250 of PrI
    Hist: SSP2-4.5 (2015-2100) continues from historical
    Cdio: 1% per year increasing of CO2 experiment (1pctCO2): starts from year ~250 of PrI
    Cfix: Fixed CO2 at 551.5 ppm starting from year 1917 of 1% CO2 run
    Cfx2: Fixed CO2 at 400.9 starting from year 1885 of 1% CO2 run
    
**Details**

The two fixed CO2 concentrations experiments (400.9 ppm and 551.5 ppm) were initialized from points corresponding to global temperature anomalies of around 1°C and 2°C in the 1pctCO2 experiment. In the fixed CO2 experiment at 400.9 ppm, Arctic warming reached approximately 3.7°C, similar to conditions during the Last Interglacial period. In the fixed CO2 experiment at 551.5 ppm, the global mean temperature increased by around 2°C. Both fixed CO2 experiments showed a rapid reduction of summer sea ice, with sea ice disappearing by the end of the simulation under the 551.5 ppm CO2 concentration. Both simulations equilibrated at a higher global warming level.

## Procedure (example)

Compiled cdftool codes can be found here:
    /nobackup/rossby26/proj/rossby/joint_exp/ligarctic/cdftools/CDFTOOLS

To compute volume flux through a given section

    ../bin/cdftransport -u Hist_1m_18510101_18511231_opa_grid_U_3D.nc -v Hist_1m_18510101_18511231_opa_grid_V_3D.nc -noheat <section.dat

 The required files are
 
    mask.nc: 3d tmask, umask and vmask
    mesh_hgr.nc: horizontal mesh information: coordinates.nc
    mesh_zgr.nc: contains vertical coordinate information (mbathy, e3t_ps, e3w_ps, gdpet_0, gdeptw_0, e3t_0, e3t_w, ...)
    gridU-file:
    gridV-file:
    section.dat: contains coordinates for ...

The source codes and compiled files are under "src" and "bin" folders.

For help, check

    https://meom-group.github.io/doc/CDFTOOLS/#cdftransport


## Miscellaneous

To get all months, you must loop cdftransport over all timesteps in a file

    cdftransport -time i

Compute vtrp_dep as the sum of ptrp_dep and ntrp_dep

    cdo   aexpr,'vtrp_dep=ptrp_dep+mtrp_dep'    tmp/1851_ATL_LAB_West_transports.nc   tmp/1851_ATL_LAB_West_transports_fixed.nc








    
