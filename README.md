# TESLA-CoSMoS Coastal risk assessment 

[![DOI](https://zenodo.org/badge/381731651.svg)](https://zenodo.org/badge/latestdoi/381731651)


Tesla-CoSMoS is combination of the Tesla-kit package (Python3 collection of libraries for numerical and statistical calculations and methodologies for handling global climate data) and the CoSMoS (Coastal Storm Modeling System, matlab scripts to generate simulation files for Delft3D, SWAN, and XBeach).

The stochastic climate emulator proposed is built on the recognition that coastal conditions are the result of meteorological forcing, and that synoptic-scale meteorology is in turn a consequence of large-scale quasi-steady atmospheric and oceanic patterns (e.g., Anderson et al. 2019). The CoSMoS simulations downscale multi-variate environmental forcing to alongshore varying coastal conditions, allowing for hypothetical futures from the climate emulator to be useful in site-specific hazard assessments (e.g., Anderson et al. in review).


## Main contents

teslakit modules:

- [alr](./teslakit/alr.py) AutoRegressive Logistic Model customized wrapper
- [climate\_emulator](./teslakit/climate_emulator.py) DWTs-Waves Extremes Statistical Emulator (GEV, Gumbel, Weibull)
- [estela](./teslakit/estela.py) SLP ESTELA Predictor module
- [extremes](./teslakit/extremes.py) Extremes Statistics library
- [intradaily](./teslakit/intradaily.py) Intradaily Hydrographs library
- [kma](./teslakit/kma.py) KMeans Classification library 
- [mda](./teslakit/mda.py) MaxDiss Classification library 
- [mjo](./teslakit/mjo.py) Madden-Julian Oscilation data functions 
- [pca](./teslakit/pca.py) Customized Principal Component Analysis library 
- [rbf](./teslakit/rbf.py) Radial Basis Function library 
- [statistical](./teslakit/statistical.py) statistical multipurpose module: KDE,
  GeneralizedPareto, Empirical Kernels for copula fit and simulation
- [storms](./teslakit/storms.py) storms and tropical cyclones library
- [tides](./teslakit/tides.py) tides functions library
- [waves](./teslakit/waves.py) waves functions library

- [plotting](./teslakit/plotting/) set of modules for teslakit data and output plotting 
- [database](./teslakit/database.py) custom database developed to ease the multiple files required for a teslakit site 

COSMOS_lite:
- [runD3DandSWAN](./COSMOS_lite/runD3DandSWAN/) Input file generation for Delft3D
- [runXBeach](./COSMOS_lite/runXBeach/) Input file generation for XBeach (loosely coupled with Delft3D output)
- [postProcess](./COSMOS_lite/postProcess/) Extracting specific model run points
- [grids](./COSMOS_lite/clean_flow_wave_model2/) subset of CoSMoS domains
- [utils](./COSMOS_lite/utils/) Supporting functions for model input/output

databases:
- Sea Level Pressure (SLP): https://www.ncdc.noaa.-gov/data-access/model-data/model-datasets/climate-forecast-system-version2-cfsv2
- Sea Surface Temperature (SST): https://www1.ncdc.noaa.gov/pub/data/cmb/ersst/v5/netcdf/
- Madden-Julian Oscillation (MJO): http://www.bom.gov.au/climate/mjo/ 
- Tropical Cyclones (TCs): https://www.ncdc.noaa.gov/ibtracs/
- Tide Gauge (WL): https://tides-andcurrents.noaa.gov/stationhome.html?id=9410170
- Waves Spectra (WVS): http://data-cbr.csiro.au/thredds/catalog/catch_all/CMAR_CAWCR-Wave_archive/CAWCR_Wave_Hindcast_aggregate/spec/catalog.xml

numerical models:
- Delft3D: https://oss.deltares.nl/web/delft3d/download
- XBeach: https://oss.deltares.nl/web/xbeach/download

## Project Map

![picture](docs/img/map.svg)


## Documentation

Anderson, D., Ruggiero, P., Mendez, F.J., Barnard, P.L., Erikson, L.H., O'Neill, A.C., Merrifield, M., Rueda, A., Cagigal, L., & Marra, J. (in review) Projecting Climate Dependent Coastal Flood Risk with a Hybrid Statistical Dynamical Model.

Anderson, D., Rueda, A., Cagigal, L., Antolinez, J. A. A., Mendez, F. J., & Ruggiero, P. (2019). Time‐varying emulator for short and long‐term analysis of coastal flood hazard potential. Journal of Geophysical Research: Oceans, 124. https://doi.org/10.1029/2019JC015312



### Installing from sources

Navigate to the base root of [teslakit](./)

Using a Python virtual environment is recommended

```
# install virtualenv package 
python3 -m pip install virtualenv

# create a new virtual environment for teslakit installation
python3 -m virtualenv venv

# now activate the virtual environment
source venv/bin/activate
```

Now install teslakit requirements

```
pip install -r requirements/requirements.txt
```

Then install teslakit

```
python setup.py install
```

### Installing SWAN numerical model


[teslakit/numerical\_models/swan/](./teslakit/numerical_models/swan/) is a custom developed python toolbox used to wrap SWAN numerical model

SWAN numerical model has to be compiled for serial execution and stored at teslakit swan binary [resources](./teslakit/numerical_models/swan/resources/) folder

First download and compile SWAN serial executable

```
  # you may need to install a fortran compiler
  sudo apt install gfortran

  # download and unpack
  wget http://swanmodel.sourceforge.net/download/zip/swan4131.tar.gz
  tar -zxvf swan4131.tar.gz

  # compile numerical model
  cd swan4131/
  make config
  make ser
```

Now manually move executable file to [resources/swan\_bin/](./teslakit/numerical_models/swan/resources/swan_bin/) and change file name to "swan\_ser.exe"

Alternatively, set swan executable file using our swan python module

```
  # Launch a python interpreter
  $ python

  Python 3.6.9 (default, Apr 18 2020, 01:56:04) 
  [GCC 8.4.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  
  >>> from teslakit.numerical_models import swan
  >>> swan.set_swan_binary_file('swan.exe')
```


### Installing optional modules

Basemap module is used in some Teslakit figures.

It is not needed to run any calculation and installing it is optional

Follow Basemap installation instructions at https://github.com/matplotlib/basemap

```
pip install git+https://github.com/matplotlib/basemap.git
```

## Handling a Teslakit Project 
- - -

Jupyter notebook files can be found at [notebooks](notebooks/)

launch jupyter notebook

```
jupyter notebook
```

Current development test site notebooks can be found at [ROI](notebooks/ROI/)

Also, test site needed input files can be downloaded from [OneDrive](https://unican-my.sharepoint.com/:f:/g/personal/ripolln_unican_es/EuqAnf1Xeg1IkS1gaqio8i0BxnwZbbsj3BQdHMoiIGIOPg?e=JGyVU5)

(Input data adquisition is currently not integrated in teslakit)


Once ROI data is downloaded and unpacked, a input data check can be done at: [00_Set_Database.ipynb](notebooks/ROI/01_Offshore/00_Set_Database.ipynb)


## Contributors

Nicolás Ripoll Cabarga (nicolas.ripoll@unican.es)\
Ana Cristina Rueda Zamora (anacristina.rueda@unican.es)\
Laura Cagigal Gil (laura.cagigal@unican.es)\
Alba Cid Carrera (alba.cid@unican.es)\
Alba Ricondo Cueva (alba.ricondo@unican.es)\
Sara Ortega Van Vloten (sara.ortegav@unican.es)\
Israel Rubio Llarena (israel.rubio@unican.es)\
Fernando Mendez Incera (fernando.mendez@unican.es)

## Thanks also to


## License

This project is licensed under the MIT License - see the [license](LICENSE.txt) file for details




