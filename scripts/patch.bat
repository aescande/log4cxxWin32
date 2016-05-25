ECHO OFF
ECHO "Start patching log4cxx"
sed -i "/#include <vector>/ a #include<iterator>" ..\log4cxx\src\main\cpp\stringhelper.cpp
IF DEFINED APPVEYOR (
  sed -i "/namespace log4cxx/ i #define DELETED_CTORS(T) \\\\\n        T(const T&) = delete;\\\\\n        T& operator=(const T&) = delete;\n\n#define DEFAULTED_AND_DELETED_CTORS(T) \\\\\n        T() = default;\\\\\n        T(const T&) = delete;\\\\\n        T& operator=(const T&) = delete;\n" ..\log4cxx\src\main\include\log4cxx\helpers\objectimpl.h
) ELSE (
  sed -i "/namespace log4cxx/ i #define DELETED_CTORS(T) \\\n        T(const T&) = delete;\\\n        T& operator=(const T&) = delete;\n\n#define DEFAULTED_AND_DELETED_CTORS(T) \\\n        T() = default;\\\n        T(const T&) = delete;\\\n        T& operator=(const T&) = delete;\n" ..\log4cxx\src\main\include\log4cxx\helpers\objectimpl.h
)
sed -i "/END_LOG4CXX_CAST_MAP()/ a \  DEFAULTED_AND_DELETED_CTORS(PatternConverter)" ..\log4cxx\src\main\include\log4cxx\pattern\patternconverter.h
sed -i "/virtual ~RollingPolicyBase();/ i \          DELETED_CTORS(RollingPolicyBase)" ..\log4cxx\src\main\include\log4cxx\rolling\RollingPolicyBase.h
sed -i "/virtual ~TriggeringPolicy();/ i \             DEFAULTED_AND_DELETED_CTORS(TriggeringPolicy)" ..\log4cxx\src\main\include\log4cxx\rolling\TriggeringPolicy.h
sed -i "/Filter();/ a \                        DELETED_CTORS(Filter)" ..\log4cxx\src\main\include\log4cxx\spi\Filter.h
sed -i "/virtual ~Layout();/ i \                DEFAULTED_AND_DELETED_CTORS(Layout)" ..\log4cxx\src\main\include\log4cxx\Layout.h
sed -i -e "s/defined(_MSC_VER) \&\&/defined(_MSC_VER) \&\& _MSC_VER < 1600 \&\&/" ..\log4cxx\src\main\include\log4cxx\log4cxx.h
REM removing temporary files created by sed
DEL sed*
ECHO "Patching done"
