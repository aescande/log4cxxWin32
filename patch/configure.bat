pushd ..\log4cxx
call configure.bat
call configure-aprutil.bat
DEL sed*
popd
call patch.bat