## installation steps for eccodes-2.32.0 on LUMI-C
  - Download the ecocodes https://confluence.ecmwf.int/display/ECC/Releases (eccodes-2.32.0-Source.tar.gz)
```
  module load LUMI/23.03 partition/C
  module load PrgEnv-cray
  module load cray-hdf5
  module load cray-netcdf
  module load libaec
  export PATH=/scratch/project_465000454/devaraju/SW/LUMI-23.03/C/ecbuild/bin:$PATH
  cd /scratch/project_465000454/devaraju/softwares/
  tar -xzf eccodes-2.32.0-Source.tar.gz
```
 - compile and install ( https://github.com/ecmwf/eccodes )
```
  cd eccodes-2.32.0-Source
  mkdir build ; cd build
  ecbuild -DCMAKE_INSTALL_PREFIX=/scratch/project_465000454/devaraju/SW/LUMI-23.03/C/eccodes-2.32.0 ../
  make
  ctest
  make install

```


