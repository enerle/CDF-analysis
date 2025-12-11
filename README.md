# CDF-analysis

## Summary

We computed volume transports across sections using the cdftransport operator from CDFTOOLS, a diagnostic package written in Fortran 90 for analyzing NEMO model outputs (github.com/meom-group/CDFTOOLS). CDFTOOLS was developed within the DRAKKAR framework to facilitate diagnostics of NEMO simulations. Total volume transport is calculated by separating and summing the positive (inflow) and negative (outflow) contributions. Depth limits were specified to define the layers over which the transports were computed. No heat or salt transport diagnostics were requested. The transport computation was performed over the time index.

Below, we present the detailed workflow for estimating ocean mass transports using EC-Earth HR simulations and CDFTOOLS.

## EC-Earth HR Simulations 

**Simulations**

    Hspu: 350-yr Pre-Industrial (PrI) for 1850
    Hist: Historical (1850-2014) starts from year ~250 of PrI
    Hist: SSP2-4.5 (2015-2100) continues from historical
    Cdio: 1% per year increasing of CO2 experiment (1pctCO2): starts from year ~250 of PrI
    Cfix: Fixed CO2 at 551.5 ppm starting from year 1917 of 1% CO2 run
    Cfx2: Fixed CO2 at 400.9 starting from year 1885 of 1% CO2 run
    
**Details**

The two fixed-CO₂ concentration experiments (400.9 ppm and 551.5 ppm) were initialized from points in the 1pctCO2 experiment corresponding to global temperature anomalies of approximately 1 °C and 2 °C, respectively. In the fixed-CO₂ experiment at 400.9 ppm, Arctic warming reached about 3.7 °C, comparable to conditions during the Last Interglacial period. In the experiment with a fixed concentration of 551.5 ppm, the global mean temperature increased by roughly 2 °C. Both fixed-CO₂ experiments exhibited a rapid reduction in summer sea ice, with complete loss of summer sea ice occurring by the end of the simulation under the 551.5 ppm scenario. In both cases, the climate system equilibrated at a higher level of global warming.

## Procedure (example)

To compute volume flux through a given section for a given year:

    ../bin/cdftransport -u Hist_1m_18510101_18511231_opa_grid_U_3D.nc -v Hist_1m_18510101_18511231_opa_grid_V_3D.nc -noheat <section.dat

 The required files are
 
    mask.nc: 3d tmask, umask and vmask
    mesh_hgr.nc: horizontal mesh information: coordinates.nc
    mesh_zgr.nc: contains vertical coordinate information (mbathy, e3t_ps, e3w_ps, gdpet_0, gdeptw_0, e3t_0, e3t_w, ...)
    gridU-file:
    gridV-file:
    section.dat: contains a list of section coordinates [imin, imax, jmin, jmax] for the computation of the volume transports

For help, check

    https://meom-group.github.io/doc/CDFTOOLS/#cdftransport
    https://github.com/meom-group/CDFTOOLS

## Miscellaneous

To get all months, you must loop cdftransport over all timesteps in a file

    cdftransport -time i

Compute vtrp_dep as the sum of ptrp_dep and ntrp_dep

    cdo   aexpr,'vtrp_dep=ptrp_dep+mtrp_dep'    tmp/1851_ATL_LAB_West_transports.nc   tmp/1851_ATL_LAB_West_transports_fixed.nc








    
