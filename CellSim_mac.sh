#!/bin/bash
# In order to operate this procedure, type 'sudo bash ./CellSim_osx.sh' in CellSim directory on a terminal to operate procedure
# Python3 is needed. You can download on the Internet or use 'python-3.5.2-macosx10.6.pkg'in the directory
# This code will upgrate pip3(9.0.1) and install matplotlib(2.0.0) and pyqt5(5.8.1) for python3, in order to run CellSim. 

version=$(pip3 -V)
if [ ${version:4:1} = 9 ]
then
   echo ”Version is OK!”
else
   pip3 install —-upgrade pip
fi

mat_info=$(pip3 show matplotlib) 
mat_v=${mat_info#*Version: }
if [ -z “$mat_v” ];
then
   pip3 install ./package/matplotlib/matplotlib-2.0.0-cp35-cp35m-macosx_10_6_intel.macosx_10_9_intel.macosx_10_9_x86_64.macosx_10_10_intel.macosx_10_10_x86_64.whl
elif ((${mat_v:0:1}>=2))
then
   echo “Matplotlib Version is OK!”
else
   pip3 install ./package/matplotlib/matplotlib-2.0.0-cp35-cp35m-macosx_10_6_intel.macosx_10_9_intel.macosx_10_9_x86_64.macosx_10_10_intel.macosx_10_10_x86_64.whl
fi

pyqt5_info=$(pip3 show pyqt5)
pyqt5_v=${pyqt5_info#*Version: }
if [ -z “$pyqt5_v” ];
then
   pip3 install ./package/pyqt5/PyQt5-5.8.1.1-5.8.0-cp35.cp36.cp37-abi3-macosx_10_6_intel.whl
elif ((${pyqt5_v:0:1}>=5))
then
   echo “PyQt5 Version is OK!”
else
   pip3 install ./package/pyqt5/PyQt5-5.8.1.1-5.8.0-cp35.cp36.cp37-abi3-macosx_10_6_intel.whl
fi

python3 ./CellSim.pyw