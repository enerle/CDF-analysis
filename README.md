# CDF-analysis

## Summary

We computed volume transports across sections using the cdftransport operator from CDFTOOLS, a diagnostic package written in Fortran 90 for analyzing NEMO model outputs (github.com/meom-group/CDFTOOLS). CDFTOOLS was developed within the DRAKKAR framework to facilitate diagnostics of NEMO simulations. Total volume transport is calculated by separating and summing the positive (inflow) and negative (outflow) contributions. Depth limits were specified to define the layers over which the transports were computed.

All CDFTOOLS calls for the DWF analysis are provided in the attached repository. In particular, the cdftransport operator was run with the following command for each section and time slice:
Additional shell scripts and exact command options (including any non-default flags) are provided using EC-Earth HR simulations. This includes loops over time indices and post-processing steps for computing mean diagnostics.

## EC-Earth HR Simulations 

**Simulations**

    Hspu: 350-yr Pre-Industrial (PrI) for 1850
    Hist: Historical (1850-2014) starts from year ~250 of PrI
    Hist: SSP2-4.5 (2015-2100) continues from historical

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








    
