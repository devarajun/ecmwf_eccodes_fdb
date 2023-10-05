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
- loaded modules while installing

```
Currently Loaded Modules:
  1) ModuleLabel/label (S)   5) craype-x86-milan     9) xpmem/2.5.2-2.4_3.47__gd0f7936.shasta      13) cray-netcdf/4.9.0.3     17) cray-libsci/23.02.1.1
  2) lumi-tools/23.04  (S)   6) craype-accel-host   10) partition/C                           (S)  14) perftools-base/23.03.0  18) cray-dsmml/0.2.2
  3) init-lumi/0.2     (S)   7) libfabric/1.15.2.0  11) cce/15.0.1                                 15) craype/2.7.20           19) cpeCray/23.03
  4) LUMI/23.03        (S)   8) craype-network-ofi  12) cray-hdf5/1.12.2.3                         16) cray-mpich/8.1.25       20) libaec/1.0.6-cpeCray-23.03
```

