#Installation 12/05/2022  on LUMI-C platform

partcdir=/scratch/project_465000454/devaraju/SW/LUMI-22.08/C
softwdir=/scratch/project_465000454/devaraju/softwares

module load LUMI/22.08
module load partition/C

cd $softwdir

#ecbuild installation
git clone -b master https://github.com/ecmwf/ecbuild.git
cd ecbuild
mkdir build && cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/scratch/project_465000454/devaraju/SW/LUMI-22.08/C/ecbuild
make install

export ecbuild_ROOT=/scratch/project_465000454/devaraju/SW/LUMI-22.08/C/ecbuild
export PATH=$ecbuild_ROOT/bin:$PATH

module load buildtools/22.08

cd $softwdir

#eccodes installation

# Downloaded manually the required version (>2.26.0) from here: https://confluence.ecmwf.int/display/ECC/Releases
tar -xzf eccodes-2.30.0-Source.tar.gz
cd eccodes-2.30.0-Source/
rm -rf build
mkdir -p build
cd build/
installdir=$partcdir/eccodes2.30.0
mkdir -p $installdir
#cmake ../ -DCMAKE_INSTALL_PREFIX=$installdir
cmake ../ -DCMAKE_INSTALL_PREFIX=$installdir -DENABLE_AEC=OFF
make
ctest
make install

export eccodes_ROOT=/scratch/project_465000454/devaraju/SW/LUMI-22.08/C/eccodes/

module load ncurses/6.2-cpeCray-22.08

#eckit installation
cd $softwdir
git clone -b master https://github.com/ecmwf/eckit.git
cd eckit
mkdir -p build
cd build/
installdir=$partcdir/eckit
srcdir=$softwdir/eckit
mkdir -p $installdir
ecbuild --prefix=$installdir -- $srcdir
cmake ../ -DCMAKE_INSTALL_PREFIX=$installdir -DENABLE_ECKIT_CMD=ON -DENABLE_MPI=ON
make install
#check eckit version
$partcdir/eckit/bin/eckit-version


#fckit installation (see more details: https://sites.ecmwf.int/docs/atlas/getting_started/install_fckit/)
export eckit_ROOT=$partcdir/eckit
cd $softwdir
git clone -b master https://github.com/ecmwf/fckit.git

cd fckit
mkdir build && cd build
installdir=$partcdir/fckit
cmake ../ -DCMAKE_INSTALL_PREFIX=$installdir
make install

export fckit_ROOT=$installdir
export PATH=$fckit_ROOT/bin:$PATH

#metkit installation
cd $softwdir
git clone https://github.com/ecmwf/metkit.git

cd metkit/
# Environment
srcdir=$(pwd)
builddir=build
installdir=$partcdir/metkit

# 1. Create the build directory:
rm -rf $builddir
mkdir -p $builddir
cd $builddir

# 2. Run CMake
ecbuild --prefix=$installdir -- -DECKIT_PATH=$partcdir/eckit $srcdir

# 3. Compile / Install
make -j10
make install

export metkit_ROOT=$installdir

#fdb installation
cd $softwdir
git clone https://github.com/ecmwf/fdb.git
# Environment
cd $softwdir/fdb/
srcdir=$(pwd)
builddir=build
installdir=$partcdir/fdb

# 1. Create the build directory:
rm -rf $builddir
mkdir $builddir
cd $builddir

# 2. Run CMake
ecbuild --prefix=$installdir -- -DCMAKE_INSTALL_PREFIX=$partcdir $srcdir

# 3. Compile / Install
cmake
make install
