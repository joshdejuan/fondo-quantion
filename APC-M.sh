#!/bin/bash

mkdir $HOME/Documents/APC-M

system_profiler -detailLevel mini > $HOME/Documents/APC-M/mSI.txt
ls -la /Applications/ > $HOME/Documents/APC-M/mSW.txt
dscl . list /Users | grep -v '_' > $HOME/Documents/APC-M/mUSERS.txt
sudo fdesetup status > $HOME/Documents/APC-M/mDISKS.txt
system_profiler SPHardwareDataType | grep Serial > $HOME/Documents/APC-M/SN.txt
system_profiler SPSoftwareDataType > $HOME/Documents/APC-M/OS.txt

sudo apt install zip

cd $HOME/Documents
zip -r APC-M.zip APC-M
rm -r $HOME/Documents/APC-M
echo OK TERMINADO

osascript -e 'tell app "System Events" to display dialog "Envia el archivo en Documentos/APC-M.zip por email a josh@quantion.com"'