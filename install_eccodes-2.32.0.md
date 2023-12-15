## installation steps for eccodes-2.32.0 on LUMI/23.03
  - ecbuild dependency (First install ecbuild: https://github.com/ecmwf/ecbuild.git)
  - Download and install the ecocodes https://confluence.ecmwf.int/display/ECC/Releases (eccodes-2.32.0-Source.tar.gz)
```
  ml LUMI/23.03 
```
 - compile and install ecbuild ( [clone](https://github.com/ecmwf/ecbuild.git))
```
  git clone -b master https://github.com/ecmwf/ecbuild.git
  cd ecbuild
  mkdir build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/projappl/project_465000454/devaraju/softwares/ecbuild
  make install
  export PATH=/projappl/project_465000454/devaraju/softwares/ecbuild/bin:$PATH
```
 - compile and install ( [eccodes](https://confluence.ecmwf.int/display/ECC/Releases) ), I have manually downloaded the version 2.32.0)
```
  ml cray-hdf5
  ml cray-netcdf
  ml libaec 
  tar -xzf eccodes-2.32.0-Source.tar.gz
  cd eccodes-2.32.0-Source
  mkdir build && cd build
  ecbuild -DCMAKE_INSTALL_PREFIX=/projappl/project_465000454/devaraju/softwares/eccodes-2.32.0 ../
  make
  ctest
  make install
```

 - List of complete loaded modules while compiling eccodes

```
Currently Loaded Modules:
  1) ModuleLabel/label (S)   5) craype-accel-host                       9) partition/L            (S)  13) craype/2.7.20          17) cray-mpich/8.1.27          (H)  21) cray-netcdf/4.9.0.3
  2) lumi-tools/23.11  (S)   6) libfabric/1.15.2.0                     10) LUMI/23.03             (S)  14) cray-libsci/23.02.1.1  18) cpeCray/23.03
  3) init-lumi/0.2     (S)   7) craype-network-ofi                     11) perftools-base/23.03.0      15) cray-dsmml/0.2.2       19) libaec/1.0.6-cpeCray-23.03
  4) craype-x86-rome         8) xpmem/2.5.2-2.4_3.50__gd0f7936.shasta  12) PrgEnv-cray/8.3.3           16) cce/15.0.1             20) cray-hdf5/1.12.2.3
```
