# cpp_dev_tools

GammaRay is a free software introspection tool for Qt application developed by KDAB.

Official website: https://www.kdab.com/development-resources/qt-tools/gammaray/

## Automated: Installation on OS : Ubuntu "16.04.5 LTS (Xenial Xerus)

* Install ubuntu dependencies
sudo apt-get install cmake cmake-extras graphviz-dev libdw-dev libbfd-dev libxt-dev gdb lldb qttools5-dev-tools




* Configure bashrc or equivalent

Add these line at the end of the file:

export QTDIR="/usr/local/Qt-5.12.3"

export PATH="/usr/local/Qt-5.12.3/bin:${PATH}"



 
* Install Gammaray
git clone https://github.com/tpabst/cpp_dev_tools.git

  or
  
git clone https://sdelangit01/pabst/cpp_dev_tools.git

mkdir build_cpp_dev_tools

cd build_cpp_dev_tools

cmake -G "Unix Makefiles" ../cpp_dev_tools -DCMAKE_INSTALL_PREFIX=/usr/local (default is "~/sysroot_x11_dev_tools")

make -j8 (8-10 min)

sudo make install

Debian Package 


__Known Errors:__

In the current master branch (87c0a0a), the right of the binary files are not automatically set. Put them manually. (This is fixed on master branch)

sudo chmod +x /usr/local/lib/gammaray/libexec/gammaray-client

sudo chmod +x /usr/local/lib/gammaray/libexec/gammaray-launcher

sudo chmod +x /usr/local/bin/gammaray


## Manual : Installation on OS : Ubuntu "16.04.5 LTS (Xenial Xerus)

Written: January the 22th 2019

Updated: January the 22th 2019


* Update and upgrade software

sudo apt-get install update

sudo apt-get upgrade

sudo apt-get dist-upgrade

sudo apt-get autoremove

sudo apt-get autoclean

sudo apt-get clean

* Install ubuntu dependencies

sudo apt-get install cmake cmake-extras graphviz-dev libdw-dev libbfd-dev libxt-dev gdb lldb


* Check if Qt-5.12.3 is installed, otherwise install it

ls /usr/local/Qt-5.12.3

* Create workspace folder

cd ~/

mkdir workspace

* Get, build and install KDStateMachineEditor

cd ~/workspace

git clone https://github.com/KDAB/KDStateMachineEditor.git

mkdir build_KDStateMachineEditor

cd build_KDStateMachineEditor

cmake ../KDStateMachineEditor -DCMAKE_PREFIX_PATH=/usr/local/Qt5.12.3

make -j4 (could be -j8 or more)

sudo make install


* Get, build and install extra-cmake-modules

(DO not install Sphinx optional module, it will not compile)


cd ~/workspace

git clone https://github.com/KDE/extra-cmake-modules.git

mkdir build_extra-cmake-modules

cd build_extra-cmake-modules

cmake ../extra-cmake-modules -DCMAKE_PREFIX_PATH=/usr/local/Qt5.12.3

sudo make install




* Get, build and install KDE syntax-highlighting


cd ~/workspace

git clone https://github.com/KDE/syntax-highlighting.git

mkdir build_syntax-highlighting

cd build_syntax-highlighting

cmake ../syntax-highlighting  -DCMAKE_PREFIX_PATH=/usr/local/Qt5.12.3

make

sudo make install


* Get, build and install glslangcd ~/workspace

git clone https://github.com/KhronosGroup/glslang.git

mkdir build_glslang

cd build_glslang

cmake -G "Unix Makefiles" ../glslang

make -j4 (could be -j8 or more)

sudo make install



* Get, build and install GammaRay


cd ~/workspace

git clone https://github.com/KDAB/GammaRay.git

mkdir build_gammaray

cd GammaRay

git checkout v2.9.0 (lastest stable release)

cd build_gammaray

cmake -G "Unix Makefiles" ../GammaRay/ -DCMAKE_PREFIX_PATH=/usr/local/Qt-5.12.3 -DGAMMARAY_BUILD_UI=ON

make

!!! WARNING: !!! This build could failed when using -j so retry or not use j more than 1

sudo make install


## Run:

Run the Qt application through gammaray

export GAMMARAY_LAUNCHER_TIMEOUT=100000 && gammaray --inprocess your application

The default timeout is too low, and the application stop quickier, so we put a high GAMMARAY_LAUNCHER_TIMEOUT value.




## Remote connection

__Troubleshoots__

Potential errors:

  Error: gdb: Yama security extension is blocking runtime attaching, see /proc/sys/kernel/yama/ptrace_scope
  
  Error: lldb: Yama security extension is blocking runtime attaching, see /proc/sys/kernel/yama/ptrace_scope
  
Uh-oh, there is no default attach injector on this platform.


__Fix__

You can temporarily disable this restriction (and revert to the old behaviour allowing your user to ptrace (gdb) any of their other processes) by doing:

echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

To permanently allow it edit /etc/sysctl.d/10-ptrace.conf and change the line:

kernel.yama.ptrace_scope = 1

To read

kernel.yama.ptrace_scope = 0

















