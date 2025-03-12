# CDF-analysis
Workflow for ocean mass transports estimation using EC-Earth HR Simulations and CDF tools 

## EC-Earth HR Simulations 
- Main directory
    /nobackup/rossby26/proj/rossby/joint_exp/ligarctic/EC-Earth3-HR_runs
- Simulations
    Hspu: 350-yr Pre-Industrial (PrI) for 1850
    Hist: Historical (1850-2014) starts from year ~250 of PrI
    Hist: SSP2-4.5 (2015-2100) continues from historical
    Cdio: 1% per year increasing of CO2 experiment (1pctCO2): starts from year ~250 of PrI
    Cfix: Fixed CO2 at 551.5 ppm starting from year 1917 of 1% CO2 run
    Cfx2: Fixed CO2 at 400.9 starting from year 1885 of 1% CO2 run
- Details:
The two fixed CO2 concentrations experiments (400.9 ppm and 551.5 ppm) were initialized from points corresponding to global temperature anomalies of around 1°C and 2°C in the 1pctCO2 experiment. In the fixed CO2 experiment at 400.9 ppm, Arctic warming reached approximately 3.7°C, similar to conditions during the Last Interglacial period. In the fixed CO2 experiment at 551.5 ppm, the global mean temperature increased by around 2°C. Both fixed CO2 experiments showed a rapid reduction of summer sea ice, with sea ice disappearing by the end of the simulation under the 551.5 ppm CO2 concentration. Both simulations equilibrated at a higher global warming level.

## Procedure
