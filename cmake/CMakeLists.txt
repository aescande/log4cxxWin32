cmake_minimum_required(VERSION 2.8.12)

INCLUDE(cmake/base.cmake)

set(PROJECT_NAME liblog4cxx)
set(PROJECT_DESCRIPTION "log4cxx library")
set(PROJECT_URL "")
set(PROJECT_VERSION 0.10.0)    # [TODO] retrieve this number automatically from lo4cxx/pom.xml
SET(PROJECT_DEBUG_POSTFIX "_d")

SETUP_PROJECT()

# Get the parent directory
get_filename_component(BASE_DIR ${CMAKE_SOURCE_DIR} DIRECTORY)


#################################################
#                     A P R                     #
#################################################

set(APR_DIR "${BASE_DIR}/apr")

# [TODO] This could be improved by using apr.hwc and defining win32_winnt_str.
# For now, we stick to the Visual Studio solution version.
configure_file(${APR_DIR}/include/apr.hw ${PROJECT_BINARY_DIR}/apr.h COPYONLY)

SET(APR_INCLUDE_DIRECTORIES
  ${PROJECT_BINARY_DIR}
  ${APR_DIR}/include
  ${APR_DIR}/include/arch
  ${APR_DIR}/include/arch/win32
  ${APR_DIR}/include/arch/unix
)

set(APR_PUBLIC_HEADERS
  ${APR_DIR}/include/apr_allocator.h
  ${APR_DIR}/include/apr_atomic.h
  ${APR_DIR}/include/apr_dso.h
  ${APR_DIR}/include/apr_env.h
  ${APR_DIR}/include/apr_errno.h
  ${APR_DIR}/include/apr_escape.h
  ${APR_DIR}/include/apr_file_info.h
  ${APR_DIR}/include/apr_file_io.h
  ${APR_DIR}/include/apr_fnmatch.h
  ${APR_DIR}/include/apr_general.h
  ${APR_DIR}/include/apr_getopt.h
  ${APR_DIR}/include/apr_global_mutex.h
  ${APR_DIR}/include/apr_hash.h
  ${APR_DIR}/include/apr_inherit.h
  ${APR_DIR}/include/apr_lib.h
  ${APR_DIR}/include/apr_mmap.h
  ${APR_DIR}/include/apr_network_io.h
  ${APR_DIR}/include/apr_poll.h
  ${APR_DIR}/include/apr_pools.h
  ${APR_DIR}/include/apr_portable.h
  ${APR_DIR}/include/apr_proc_mutex.h
  ${APR_DIR}/include/apr_random.h
  ${APR_DIR}/include/apr_ring.h
  ${APR_DIR}/include/apr_shm.h
  ${APR_DIR}/include/apr_signal.h
  ${APR_DIR}/include/apr_skiplist.h
  ${APR_DIR}/include/apr_strings.h
  ${APR_DIR}/include/apr_support.h
  ${APR_DIR}/include/apr_tables.h
  ${APR_DIR}/include/apr_thread_cond.h
  ${APR_DIR}/include/apr_thread_mutex.h
  ${APR_DIR}/include/apr_thread_proc.h
  ${APR_DIR}/include/apr_thread_rwlock.h
  ${APR_DIR}/include/apr_time.h
  ${APR_DIR}/include/apr_user.h
  ${APR_DIR}/include/apr_version.h
  ${APR_DIR}/include/apr_want.h
  ${APR_DIR}/include/apr.hw
  )
source_group("Public Header Files" FILES ${APR_PUBLIC_HEADERS})  
  
set(APR_PRIVATE_HEADERS	
  ${APR_DIR}/include/arch/apr_private_common.h
  ${APR_DIR}/include/arch/win32/apr_arch_atime.h
  ${APR_DIR}/include/arch/win32/apr_arch_dso.h
  ${APR_DIR}/include/arch/win32/apr_arch_file_io.h
  ${APR_DIR}/include/arch/win32/apr_arch_inherit.h
  ${APR_DIR}/include/arch/win32/apr_arch_misc.h
  ${APR_DIR}/include/arch/win32/apr_arch_networkio.h
  ${APR_DIR}/include/arch/win32/apr_arch_threadproc.h
  ${APR_DIR}/include/arch/win32/apr_arch_thread_mutex.h
  ${APR_DIR}/include/arch/win32/apr_arch_thread_rwlock.h
  ${APR_DIR}/include/arch/win32/apr_arch_utf8.h
  ${APR_DIR}/include/arch/win32/apr_private.h
  )
source_group("Private Header Files" FILES ${APR_PRIVATE_HEADERS})
  
set(APR_SRC 
  ${APR_DIR}/atomic/win32/apr_atomic.c
  ${APR_DIR}/dso/win32/dso.c
  ${APR_DIR}/encoding/apr_escape.c
  ${APR_DIR}/file_io/unix/copy.c
  ${APR_DIR}/file_io/unix/fileacc.c
  ${APR_DIR}/file_io/unix/filepath_util.c
  ${APR_DIR}/file_io/unix/fullrw.c
  ${APR_DIR}/file_io/unix/mktemp.c
  ${APR_DIR}/file_io/unix/tempdir.c
  ${APR_DIR}/file_io/win32/buffer.c
  ${APR_DIR}/file_io/win32/dir.c
  ${APR_DIR}/file_io/win32/filedup.c
  ${APR_DIR}/file_io/win32/filepath.c
  ${APR_DIR}/file_io/win32/filestat.c
  ${APR_DIR}/file_io/win32/filesys.c
  ${APR_DIR}/file_io/win32/flock.c
  ${APR_DIR}/file_io/win32/open.c
  ${APR_DIR}/file_io/win32/pipe.c
  ${APR_DIR}/file_io/win32/readwrite.c
  ${APR_DIR}/file_io/win32/seek.c
  ${APR_DIR}/locks/win32/proc_mutex.c
  ${APR_DIR}/locks/win32/thread_cond.c
  ${APR_DIR}/locks/win32/thread_mutex.c
  ${APR_DIR}/locks/win32/thread_rwlock.c
  ${APR_DIR}/memory/unix/apr_pools.c
  ${APR_DIR}/misc/unix/errorcodes.c
  ${APR_DIR}/misc/unix/getopt.c
  ${APR_DIR}/misc/unix/otherchild.c
  ${APR_DIR}/misc/unix/version.c
  ${APR_DIR}/misc/win32/apr_app.c
  ${APR_DIR}/misc/win32/charset.c
  ${APR_DIR}/misc/win32/env.c
  ${APR_DIR}/misc/win32/internal.c
  ${APR_DIR}/misc/win32/misc.c
  ${APR_DIR}/misc/win32/rand.c
  ${APR_DIR}/misc/win32/start.c
  ${APR_DIR}/misc/win32/utf8.c
  ${APR_DIR}/mmap/unix/common.c
  ${APR_DIR}/mmap/win32/mmap.c
  ${APR_DIR}/network_io/unix/inet_ntop.c
  ${APR_DIR}/network_io/unix/inet_pton.c
  ${APR_DIR}/network_io/unix/multicast.c
  ${APR_DIR}/network_io/unix/sockaddr.c
  ${APR_DIR}/network_io/unix/socket_util.c
  ${APR_DIR}/network_io/win32/sendrecv.c
  ${APR_DIR}/network_io/win32/sockets.c
  ${APR_DIR}/network_io/win32/sockopt.c
  ${APR_DIR}/passwd/apr_getpass.c
  ${APR_DIR}/poll/unix/poll.c
  ${APR_DIR}/poll/unix/pollcb.c
  ${APR_DIR}/poll/unix/pollset.c
  ${APR_DIR}/poll/unix/select.c
  ${APR_DIR}/random/unix/apr_random.c
  ${APR_DIR}/random/unix/sha2.c
  ${APR_DIR}/random/unix/sha2_glue.c
  ${APR_DIR}/shmem/win32/shm.c
  ${APR_DIR}/strings/apr_cpystrn.c
  ${APR_DIR}/strings/apr_fnmatch.c
  ${APR_DIR}/strings/apr_snprintf.c
  ${APR_DIR}/strings/apr_strings.c
  ${APR_DIR}/strings/apr_strnatcmp.c
  ${APR_DIR}/strings/apr_strtok.c
  ${APR_DIR}/tables/apr_hash.c
  ${APR_DIR}/tables/apr_skiplist.c
  ${APR_DIR}/tables/apr_tables.c
  ${APR_DIR}/threadproc/win32/proc.c
  ${APR_DIR}/threadproc/win32/signals.c
  ${APR_DIR}/threadproc/win32/thread.c
  ${APR_DIR}/threadproc/win32/threadpriv.c
  ${APR_DIR}/time/win32/time.c
  ${APR_DIR}/time/win32/timestr.c
  ${APR_DIR}/user/win32/groupinfo.c
  ${APR_DIR}/user/win32/userinfo.c
  )

# Create the APR library
add_library(apr STATIC ${APR_SRC} ${APR_PUBLIC_HEADERS} ${APR_PRIVATE_HEADERS})
target_include_directories(apr PUBLIC ${APR_INCLUDE_DIRECTORIES})
target_compile_options(apr PUBLIC "-DAPR_DECLARE_EXPORT" "-DWINNT")

# The following lines are a cmake port of custom pre-build event
# if not exist ".\build\misc" mkdir .\build\misc
# cl.exe /nologo /W3 /EHsc /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FD /I "..\apr\include" /Fo.\build\misc\gen_test_char /Fe.\build\misc\gen_test_char.exe ..\apr\tools\gen_test_char.c  
# .\build\misc\gen_test_char.exe > ..\apr\include\apr_escape_test_char.h

### Generating the file apr_escape_test_char.h
# First we build an executable
add_executable(gen_test_char ${APR_DIR}/tools/gen_test_char.c)
# Then we run it
add_custom_command(TARGET apr PRE_BUILD
                   COMMAND gen_test_char > ${APR_DIR}/include/apr_escape_test_char.h
				   DEPENDS gen_test_char)
add_dependencies(apr gen_test_char)
#################################################
#                     X M L                     #
#################################################

set(XML_DIR ${BASE_DIR}/apr-util/xml/expat/lib)
set(XML_HEADERS
  ${XML_DIR}/ascii.h
  ${XML_DIR}/asciitab.h
  ${XML_DIR}/expat.h
  ${XML_DIR}/iasciitab.h
  ${XML_DIR}/latin1tab.h
  ${XML_DIR}/nametab.h
  ${XML_DIR}/utf8tab.h
  ${XML_DIR}/winconfig.h
  ${XML_DIR}/xmlrole.h
  ${XML_DIR}/xmltok.h
  ${XML_DIR}/xmltok_impl.h
  )
  
set(XML_SRC
  ${XML_DIR}/xmlparse.c
  ${XML_DIR}/xmlrole.c
  ${XML_DIR}/xmltok.c
  )
  
add_library(xml STATIC ${XML_SRC} ${XML_HEADERS})
target_compile_options(xml PUBLIC "-DCOMPILED_FROM_DSP" "-DXML_STATIC")


#################################################
#                A P R - U T I L                #
#################################################
set(APRUTIL_DIR ${BASE_DIR}/apr-util)

# [TODO] For the two first file, this could be improved by using the .hwc files
# after setting the corresponding variables.
# For now, we stick to the Visual Studio solution version.
configure_file(${APRUTIL_DIR}/include/apu.hw
               ${PROJECT_BINARY_DIR}/apu.h
			   COPYONLY)
configure_file(${APRUTIL_DIR}/include/apr_ldap.hw
               ${PROJECT_BINARY_DIR}/apr_ldap.h
			   COPYONLY)
configure_file(${APRUTIL_DIR}/include/private/apu_config.hw
               ${PROJECT_BINARY_DIR}/apu_config.h
               COPYONLY)
configure_file(${APRUTIL_DIR}/include/private/apu_select_dbm.hw
               ${PROJECT_BINARY_DIR}/apu_select_dbm.h
               COPYONLY)
configure_file(${APRUTIL_DIR}/include/apu_want.hw
               ${PROJECT_BINARY_DIR}/apu_want.h
               COPYONLY)

set(APRUTIL_INCLUDE_DIRECTORIES
  ${PROJECT_BINARY_DIR}
  ${APRUTIL_DIR}/include
  ${APR_DIR}/include
  ${APRUTIL_DIR}/include/private
  ${APRUTIL_DIR}/apr-util/dbm/sdbm
  ${XML_DIR}
  )

# We include these files to mirror the Visual Studio solution, but I don't
# see the necessity/utility. [TODO] Remove?
set(APRUTIL_GENERATED_FILES
  ${APRUTIL_DIR}/include/apr_ldap.h.in
  ${APRUTIL_DIR}/include/apr_ldap.hnw
  ${APRUTIL_DIR}/include/apr_ldap.hw
  ${APRUTIL_DIR}/include/apu.h.in
  ${APRUTIL_DIR}/include/apu.hnw
  ${APRUTIL_DIR}/include/apu.hw
  ${APRUTIL_DIR}/include/apu_want.h.in
  ${APRUTIL_DIR}/include/apu_want.hnw
  ${APRUTIL_DIR}/include/apu_want.hw
  ${APRUTIL_DIR}/include/private/apu_config.hnw
  ${APRUTIL_DIR}/include/private/apu_config.hw
  ${APRUTIL_DIR}/include/private/apu_select_dbm.h.in
  ${APRUTIL_DIR}/include/private/apu_select_dbm.hw
  )
source_group("Generated Files" FILES ${APRUTIL_GENERATED_FILES})
  
set(APRUTIL_HEADERS  
  ${APRUTIL_DIR}/crypto/crypt_blowfish.h
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_pair.h
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_private.h
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_tune.h
  ${APRUTIL_DIR}/include/apr_anylock.h
  ${APRUTIL_DIR}/include/apr_base64.h
  ${APRUTIL_DIR}/include/apr_buckets.h
  ${APRUTIL_DIR}/include/apr_date.h
  ${APRUTIL_DIR}/include/apr_dbm.h
  ${APRUTIL_DIR}/include/apr_hooks.h
  ${APRUTIL_DIR}/include/apr_ldap_url.h
  ${APRUTIL_DIR}/include/apr_md4.h
  ${APRUTIL_DIR}/include/apr_md5.h
  ${APRUTIL_DIR}/include/apr_memcache.h
  ${APRUTIL_DIR}/include/apr_optional.h
  ${APRUTIL_DIR}/include/apr_optional_hooks.h
  ${APRUTIL_DIR}/include/apr_queue.h
  ${APRUTIL_DIR}/include/apr_reslist.h
  ${APRUTIL_DIR}/include/apr_rmm.h
  ${APRUTIL_DIR}/include/apr_sdbm.h
  ${APRUTIL_DIR}/include/apr_sha1.h
  ${APRUTIL_DIR}/include/apr_strmatch.h
  ${APRUTIL_DIR}/include/apr_thread_pool.h
  ${APRUTIL_DIR}/include/apr_uri.h
  ${APRUTIL_DIR}/include/apr_uuid.h
  ${APRUTIL_DIR}/include/apr_xlate.h
  ${APRUTIL_DIR}/include/apr_xml.h
  ${APRUTIL_DIR}/include/apu_version.h
  )
source_group("Public Header Files" FILES ${APRUTIL_HEADERS})
  
set(APRUTIL_SRC
  ${APRUTIL_DIR}/buckets/apr_brigade.c
  ${APRUTIL_DIR}/buckets/apr_buckets.c
  ${APRUTIL_DIR}/buckets/apr_buckets_alloc.c
  ${APRUTIL_DIR}/buckets/apr_buckets_eos.c
  ${APRUTIL_DIR}/buckets/apr_buckets_file.c
  ${APRUTIL_DIR}/buckets/apr_buckets_flush.c
  ${APRUTIL_DIR}/buckets/apr_buckets_heap.c
  ${APRUTIL_DIR}/buckets/apr_buckets_mmap.c
  ${APRUTIL_DIR}/buckets/apr_buckets_pipe.c
  ${APRUTIL_DIR}/buckets/apr_buckets_pool.c
  ${APRUTIL_DIR}/buckets/apr_buckets_refcount.c
  ${APRUTIL_DIR}/buckets/apr_buckets_simple.c
  ${APRUTIL_DIR}/buckets/apr_buckets_socket.c
  ${APRUTIL_DIR}/crypto/apr_crypto.c
  ${APRUTIL_DIR}/crypto/apr_md4.c
  ${APRUTIL_DIR}/crypto/apr_md5.c
  ${APRUTIL_DIR}/crypto/apr_passwd.c
  ${APRUTIL_DIR}/crypto/apr_sha1.c
  ${APRUTIL_DIR}/crypto/crypt_blowfish.c
  ${APRUTIL_DIR}/crypto/getuuid.c
  ${APRUTIL_DIR}/crypto/uuid.c
  ${APRUTIL_DIR}/dbd/apr_dbd.c
  ${APRUTIL_DIR}/dbd/apr_dbd_freetds.c
  ${APRUTIL_DIR}/dbd/apr_dbd_mysql.c
  ${APRUTIL_DIR}/dbd/apr_dbd_odbc.c
  ${APRUTIL_DIR}/dbd/apr_dbd_oracle.c
  ${APRUTIL_DIR}/dbd/apr_dbd_pgsql.c
  ${APRUTIL_DIR}/dbd/apr_dbd_sqlite2.c
  ${APRUTIL_DIR}/dbd/apr_dbd_sqlite3.c
  ${APRUTIL_DIR}/dbm/apr_dbm.c
  ${APRUTIL_DIR}/dbm/apr_dbm_berkeleydb.c
  ${APRUTIL_DIR}/dbm/apr_dbm_gdbm.c
  ${APRUTIL_DIR}/dbm/apr_dbm_sdbm.c
  ${APRUTIL_DIR}/dbm/sdbm/sdbm.c
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_hash.c
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_lock.c
  ${APRUTIL_DIR}/dbm/sdbm/sdbm_pair.c
  ${APRUTIL_DIR}/encoding/apr_base64.c
  ${APRUTIL_DIR}/hooks/apr_hooks.c
  ${APRUTIL_DIR}/ldap/apr_ldap_init.c
  ${APRUTIL_DIR}/ldap/apr_ldap_option.c
  ${APRUTIL_DIR}/ldap/apr_ldap_rebind.c
  ${APRUTIL_DIR}/ldap/apr_ldap_stub.c
  ${APRUTIL_DIR}/ldap/apr_ldap_url.c
  ${APRUTIL_DIR}/memcache/apr_memcache.c
  ${APRUTIL_DIR}/misc/apr_date.c
  ${APRUTIL_DIR}/misc/apr_queue.c
  ${APRUTIL_DIR}/misc/apr_reslist.c
  ${APRUTIL_DIR}/misc/apr_rmm.c
  ${APRUTIL_DIR}/misc/apr_thread_pool.c
  ${APRUTIL_DIR}/misc/apu_dso.c
  ${APRUTIL_DIR}/misc/apu_version.c
  ${APRUTIL_DIR}/strmatch/apr_strmatch.c
  ${APRUTIL_DIR}/uri/apr_uri.c
  ${APRUTIL_DIR}/xlate/xlate.c
  ${APRUTIL_DIR}/xml/apr_xml.c
  )

add_library(aprutil STATIC ${APRUTIL_SRC} ${APRUTIL_HEADERS} ${APRUTIL_GENERATED_FILES})
target_include_directories(aprutil PUBLIC ${APRUTIL_INCLUDE_DIRECTORIES})
target_compile_options(aprutil PUBLIC 
                       "-DAPR_DECLARE_STATIC"
                       "-DAPU_DECLARE_STATIC"
                       "-DAPI_DECLARE_STATIC"
                       "-DAPU_USE_SDBM"
                       "-DHAVE_SQL_H"
                       "-DXML_STATIC")
add_dependencies(aprutil apr xml)

#################################################
#                 L O G 4 C X X                 #
#################################################
set(LOG4CXX_DIR ${BASE_DIR}/log4cxx/src/main)

set(LOG4CXX_INCLUDE_DIRECTORIES
  ${PROJECT_BINARY_DIR}
  ${LOG4CXX_DIR}/include
  ${APR_DIR}/include
  ${APRUTIL_DIR}/include
  )

set(LOG4CXX_HEADERS
  ${LOG4CXX_DIR}/include/log4cxx/appender.h
  ${LOG4CXX_DIR}/include/log4cxx/appenderskeleton.h
  ${LOG4CXX_DIR}/include/log4cxx/asyncappender.h
  ${LOG4CXX_DIR}/include/log4cxx/basicconfigurator.h
  ${LOG4CXX_DIR}/include/log4cxx/config/propertysetter.h
  ${LOG4CXX_DIR}/include/log4cxx/consoleappender.h
  ${LOG4CXX_DIR}/include/log4cxx/dailyrollingfileappender.h
  ${LOG4CXX_DIR}/include/log4cxx/db/odbcappender.h
  ${LOG4CXX_DIR}/include/log4cxx/defaultconfigurator.h
  ${LOG4CXX_DIR}/include/log4cxx/defaultloggerfactory.h
  ${LOG4CXX_DIR}/include/log4cxx/file.h
  ${LOG4CXX_DIR}/include/log4cxx/fileappender.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/andfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/denyallfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/expressionfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/levelmatchfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/levelrangefilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/locationinfofilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/mapfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/propertyfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/filter/stringmatchfilter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/absolutetimedateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/appenderattachableimpl.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/aprinitializer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/bufferedoutputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/bufferedwriter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/bytearrayinputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/bytearrayoutputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/bytebuffer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/cacheddateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/charsetdecoder.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/charsetencoder.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/class.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/classregistration.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/condition.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/cyclicbuffer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/datagrampacket.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/datagramsocket.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/date.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/dateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/datelayout.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/datetimedateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/exception.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/fileinputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/fileoutputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/filewatchdog.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/inetaddress.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/inputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/inputstreamreader.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/integer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/iso8601dateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/loader.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/locale.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/loglog.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/messagebuffer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/mutex.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/object.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/objectimpl.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/objectoutputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/objectptr.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/onlyonceerrorhandler.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/optionconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/outputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/outputstreamwriter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/pool.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/properties.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/propertyresourcebundle.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/reader.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/relativetimedateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/resourcebundle.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/serversocket.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/simpledateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/socket.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/socketoutputstream.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/strftimedateformat.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/strictmath.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/stringhelper.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/stringtokenizer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/synchronized.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/syslogwriter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/system.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/systemerrwriter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/systemoutwriter.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/tchar.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/thread.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/threadlocal.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/threadspecificdata.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/timezone.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/transcoder.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/transform.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/writer.h
  ${LOG4CXX_DIR}/include/log4cxx/helpers/xml.h
  ${LOG4CXX_DIR}/include/log4cxx/hierarchy.h
  ${LOG4CXX_DIR}/include/log4cxx/htmllayout.h
  ${LOG4CXX_DIR}/include/log4cxx/layout.h
  ${LOG4CXX_DIR}/include/log4cxx/level.h
  ${LOG4CXX_DIR}/include/log4cxx/log4cxx.h
  ${LOG4CXX_DIR}/include/log4cxx/logger.h
  ${LOG4CXX_DIR}/include/log4cxx/logmanager.h
  ${LOG4CXX_DIR}/include/log4cxx/logstring.h
  ${LOG4CXX_DIR}/include/log4cxx/mdc.h
  ${LOG4CXX_DIR}/include/log4cxx/ndc.h
  ${LOG4CXX_DIR}/include/log4cxx/net/smtpappender.h
  ${LOG4CXX_DIR}/include/log4cxx/net/socketappender.h
  ${LOG4CXX_DIR}/include/log4cxx/net/socketappenderskeleton.h
  ${LOG4CXX_DIR}/include/log4cxx/net/sockethubappender.h
  ${LOG4CXX_DIR}/include/log4cxx/net/syslogappender.h
  ${LOG4CXX_DIR}/include/log4cxx/net/telnetappender.h
  ${LOG4CXX_DIR}/include/log4cxx/net/xmlsocketappender.h
  ${LOG4CXX_DIR}/include/log4cxx/nt/nteventlogappender.h
  ${LOG4CXX_DIR}/include/log4cxx/nt/outputdebugstringappender.h
  ${LOG4CXX_DIR}/include/log4cxx/patternlayout.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/classnamepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/datepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/filedatepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/filelocationpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/formattinginfo.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/fulllocationpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/integerpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/levelpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/linelocationpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/lineseparatorpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/literalpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/loggerpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/loggingeventpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/messagepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/methodlocationpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/nameabbreviator.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/namepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/ndcpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/patternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/patternparser.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/propertiespatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/relativetimepatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/threadpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/pattern/throwableinformationpatternconverter.h
  ${LOG4CXX_DIR}/include/log4cxx/portability.h
  ${LOG4CXX_DIR}/include/log4cxx/private/log4cxx_private.h
  ${LOG4CXX_DIR}/include/log4cxx/propertyconfigurator.h
  ${LOG4CXX_DIR}/include/log4cxx/provisionnode.h
  ${LOG4CXX_DIR}/include/log4cxx/rollingfileappender.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/action.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/filerenameaction.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/filterbasedtriggeringpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/fixedwindowrollingpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/gzcompressaction.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/manualtriggeringpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/rollingfileappender.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/rollingfileappenderskeleton.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/rollingpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/rollingpolicybase.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/rolloverdescription.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/sizebasedtriggeringpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/timebasedrollingpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/triggeringpolicy.h
  ${LOG4CXX_DIR}/include/log4cxx/rolling/zipcompressaction.h
  ${LOG4CXX_DIR}/include/log4cxx/simplelayout.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/appenderattachable.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/configurator.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/defaultrepositoryselector.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/errorhandler.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/filter.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/hierarchyeventlistener.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/location/locationinfo.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/loggerfactory.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/loggerrepository.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/loggingevent.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/optionhandler.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/repositoryselector.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/rootlogger.h
  ${LOG4CXX_DIR}/include/log4cxx/spi/triggeringeventevaluator.h
  ${LOG4CXX_DIR}/include/log4cxx/stream.h
  ${LOG4CXX_DIR}/include/log4cxx/ttcclayout.h
  ${LOG4CXX_DIR}/include/log4cxx/varia/fallbackerrorhandler.h
  ${LOG4CXX_DIR}/include/log4cxx/writerappender.h
  ${LOG4CXX_DIR}/include/log4cxx/xml/domconfigurator.h
  ${LOG4CXX_DIR}/include/log4cxx/xml/xmllayout.h
  )
  
set(LOG4CXX_SRC
  ${LOG4CXX_DIR}/cpp/action.cpp
  ${LOG4CXX_DIR}/cpp/appenderattachableimpl.cpp
  ${LOG4CXX_DIR}/cpp/appenderskeleton.cpp
  ${LOG4CXX_DIR}/cpp/aprinitializer.cpp
  ${LOG4CXX_DIR}/cpp/asyncappender.cpp
  ${LOG4CXX_DIR}/cpp/basicconfigurator.cpp
  ${LOG4CXX_DIR}/cpp/bufferedwriter.cpp
  ${LOG4CXX_DIR}/cpp/bytearrayinputstream.cpp
  ${LOG4CXX_DIR}/cpp/bytearrayoutputstream.cpp
  ${LOG4CXX_DIR}/cpp/bytebuffer.cpp
  ${LOG4CXX_DIR}/cpp/cacheddateformat.cpp
  ${LOG4CXX_DIR}/cpp/charsetdecoder.cpp
  ${LOG4CXX_DIR}/cpp/charsetencoder.cpp
  ${LOG4CXX_DIR}/cpp/class.cpp
  ${LOG4CXX_DIR}/cpp/classnamepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/classregistration.cpp
  ${LOG4CXX_DIR}/cpp/condition.cpp
  ${LOG4CXX_DIR}/cpp/configurator.cpp
  ${LOG4CXX_DIR}/cpp/consoleappender.cpp
  ${LOG4CXX_DIR}/cpp/cyclicbuffer.cpp
  ${LOG4CXX_DIR}/cpp/dailyrollingfileappender.cpp
  ${LOG4CXX_DIR}/cpp/datagrampacket.cpp
  ${LOG4CXX_DIR}/cpp/datagramsocket.cpp
  ${LOG4CXX_DIR}/cpp/date.cpp
  ${LOG4CXX_DIR}/cpp/dateformat.cpp
  ${LOG4CXX_DIR}/cpp/datelayout.cpp
  ${LOG4CXX_DIR}/cpp/datepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/defaultconfigurator.cpp
  ${LOG4CXX_DIR}/cpp/defaultloggerfactory.cpp
  ${LOG4CXX_DIR}/cpp/defaultrepositoryselector.cpp
  ${LOG4CXX_DIR}/cpp/domconfigurator.cpp
  ${LOG4CXX_DIR}/cpp/exception.cpp
  ${LOG4CXX_DIR}/cpp/fallbackerrorhandler.cpp
  ${LOG4CXX_DIR}/cpp/file.cpp
  ${LOG4CXX_DIR}/cpp/fileappender.cpp
  ${LOG4CXX_DIR}/cpp/filedatepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/fileinputstream.cpp
  ${LOG4CXX_DIR}/cpp/filelocationpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/fileoutputstream.cpp
  ${LOG4CXX_DIR}/cpp/filerenameaction.cpp
  ${LOG4CXX_DIR}/cpp/filewatchdog.cpp
  ${LOG4CXX_DIR}/cpp/filter.cpp
  ${LOG4CXX_DIR}/cpp/filterbasedtriggeringpolicy.cpp
  ${LOG4CXX_DIR}/cpp/fixedwindowrollingpolicy.cpp
  ${LOG4CXX_DIR}/cpp/formattinginfo.cpp
  ${LOG4CXX_DIR}/cpp/fulllocationpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/gzcompressaction.cpp
  ${LOG4CXX_DIR}/cpp/hierarchy.cpp
  ${LOG4CXX_DIR}/cpp/htmllayout.cpp
  ${LOG4CXX_DIR}/cpp/inetaddress.cpp
  ${LOG4CXX_DIR}/cpp/inputstream.cpp
  ${LOG4CXX_DIR}/cpp/inputstreamreader.cpp
  ${LOG4CXX_DIR}/cpp/integer.cpp
  ${LOG4CXX_DIR}/cpp/integerpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/layout.cpp
  ${LOG4CXX_DIR}/cpp/level.cpp
  ${LOG4CXX_DIR}/cpp/levelmatchfilter.cpp
  ${LOG4CXX_DIR}/cpp/levelpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/levelrangefilter.cpp
  ${LOG4CXX_DIR}/cpp/linelocationpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/lineseparatorpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/literalpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/loader.cpp
  ${LOG4CXX_DIR}/cpp/locale.cpp
  ${LOG4CXX_DIR}/cpp/locationinfo.cpp
  ${LOG4CXX_DIR}/cpp/logger.cpp
  ${LOG4CXX_DIR}/cpp/loggerpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/loggingevent.cpp
  ${LOG4CXX_DIR}/cpp/loggingeventpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/loglog.cpp
  ${LOG4CXX_DIR}/cpp/logmanager.cpp
  ${LOG4CXX_DIR}/cpp/logstream.cpp
  ${LOG4CXX_DIR}/cpp/manualtriggeringpolicy.cpp
  ${LOG4CXX_DIR}/cpp/mdc.cpp
  ${LOG4CXX_DIR}/cpp/messagebuffer.cpp
  ${LOG4CXX_DIR}/cpp/messagepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/methodlocationpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/mutex.cpp
  ${LOG4CXX_DIR}/cpp/nameabbreviator.cpp
  ${LOG4CXX_DIR}/cpp/namepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/ndc.cpp
  ${LOG4CXX_DIR}/cpp/ndcpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/nteventlogappender.cpp
  ${LOG4CXX_DIR}/cpp/objectimpl.cpp
  ${LOG4CXX_DIR}/cpp/objectoutputstream.cpp
  ${LOG4CXX_DIR}/cpp/objectptr.cpp
  ${LOG4CXX_DIR}/cpp/obsoleterollingfileappender.cpp
  ${LOG4CXX_DIR}/cpp/odbcappender.cpp
  ${LOG4CXX_DIR}/cpp/onlyonceerrorhandler.cpp
  ${LOG4CXX_DIR}/cpp/optionconverter.cpp
  ${LOG4CXX_DIR}/cpp/outputdebugstringappender.cpp
  ${LOG4CXX_DIR}/cpp/outputstream.cpp
  ${LOG4CXX_DIR}/cpp/outputstreamwriter.cpp
  ${LOG4CXX_DIR}/cpp/patternconverter.cpp
  ${LOG4CXX_DIR}/cpp/patternlayout.cpp
  ${LOG4CXX_DIR}/cpp/patternparser.cpp
  ${LOG4CXX_DIR}/cpp/pool.cpp
  ${LOG4CXX_DIR}/cpp/properties.cpp
  ${LOG4CXX_DIR}/cpp/propertiespatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/propertyconfigurator.cpp
  ${LOG4CXX_DIR}/cpp/propertyresourcebundle.cpp
  ${LOG4CXX_DIR}/cpp/propertysetter.cpp
  ${LOG4CXX_DIR}/cpp/reader.cpp
  ${LOG4CXX_DIR}/cpp/relativetimedateformat.cpp
  ${LOG4CXX_DIR}/cpp/relativetimepatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/resourcebundle.cpp
  ${LOG4CXX_DIR}/cpp/rollingfileappender.cpp
  ${LOG4CXX_DIR}/cpp/rollingpolicy.cpp
  ${LOG4CXX_DIR}/cpp/rollingpolicybase.cpp
  ${LOG4CXX_DIR}/cpp/rolloverdescription.cpp
  ${LOG4CXX_DIR}/cpp/rootlogger.cpp
  ${LOG4CXX_DIR}/cpp/serversocket.cpp
  ${LOG4CXX_DIR}/cpp/simpledateformat.cpp
  ${LOG4CXX_DIR}/cpp/simplelayout.cpp
  ${LOG4CXX_DIR}/cpp/sizebasedtriggeringpolicy.cpp
  ${LOG4CXX_DIR}/cpp/smtpappender.cpp
  ${LOG4CXX_DIR}/cpp/socket.cpp
  ${LOG4CXX_DIR}/cpp/socketappender.cpp
  ${LOG4CXX_DIR}/cpp/socketappenderskeleton.cpp
  ${LOG4CXX_DIR}/cpp/sockethubappender.cpp
  ${LOG4CXX_DIR}/cpp/socketoutputstream.cpp
  ${LOG4CXX_DIR}/cpp/strftimedateformat.cpp
  ${LOG4CXX_DIR}/cpp/stringhelper.cpp
  ${LOG4CXX_DIR}/cpp/stringmatchfilter.cpp
  ${LOG4CXX_DIR}/cpp/stringtokenizer.cpp
  ${LOG4CXX_DIR}/cpp/synchronized.cpp
  ${LOG4CXX_DIR}/cpp/syslogappender.cpp
  ${LOG4CXX_DIR}/cpp/syslogwriter.cpp
  ${LOG4CXX_DIR}/cpp/system.cpp
  ${LOG4CXX_DIR}/cpp/systemerrwriter.cpp
  ${LOG4CXX_DIR}/cpp/systemoutwriter.cpp
  ${LOG4CXX_DIR}/cpp/telnetappender.cpp
  ${LOG4CXX_DIR}/cpp/threadcxx.cpp
  ${LOG4CXX_DIR}/cpp/threadlocal.cpp
  ${LOG4CXX_DIR}/cpp/threadpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/threadspecificdata.cpp
  ${LOG4CXX_DIR}/cpp/throwableinformationpatternconverter.cpp
  ${LOG4CXX_DIR}/cpp/timebasedrollingpolicy.cpp
  ${LOG4CXX_DIR}/cpp/timezone.cpp
  ${LOG4CXX_DIR}/cpp/transcoder.cpp
  ${LOG4CXX_DIR}/cpp/transform.cpp
  ${LOG4CXX_DIR}/cpp/triggeringpolicy.cpp
  ${LOG4CXX_DIR}/cpp/ttcclayout.cpp
  ${LOG4CXX_DIR}/cpp/writer.cpp
  ${LOG4CXX_DIR}/cpp/writerappender.cpp
  ${LOG4CXX_DIR}/cpp/xmllayout.cpp
  ${LOG4CXX_DIR}/cpp/xmlsocketappender.cpp
  ${LOG4CXX_DIR}/cpp/zipcompressaction.cpp
  )

set(LOG4CXX_LIBRARY_NAME log4cxx)
add_library(${LOG4CXX_LIBRARY_NAME} SHARED ${LOG4CXX_SRC} ${LOG4CXX_HEADERS})
target_include_directories(${LOG4CXX_LIBRARY_NAME} PUBLIC ${LOG4CXX_INCLUDE_DIRECTORIES})
target_compile_options(${LOG4CXX_LIBRARY_NAME} PUBLIC 
                       "-D_USRDLL"
                       "-DDLL_EXPORTS"
                       "-DLOG4CXX"
                       "-DAPR_DECLARE_STATIC"
                       "-DAPU_DECLARE_STATIC")
# This dependencies are automatically added in a handmade VS solution but they
# are forgotten by cmake (at least for 3.2.3 version)
set(MISSING_AUTOMATIC_DEPEDENCIES odbc32 odbccp32)
target_link_libraries(${LOG4CXX_LIBRARY_NAME} 
  apr
  aprutil
  xml
  ws2_32
  Rpcrt4
  Mswsock
  ${MISSING_AUTOMATIC_DEPEDENCIES}
  )
add_dependencies(${LOG4CXX_LIBRARY_NAME} aprutil apr)
set_target_properties(${LOG4CXX_LIBRARY_NAME} PROPERTIES VERSION ${PROJECT_VERSION})
install(TARGETS ${LOG4CXX_LIBRARY_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        )
		
IF(MSVC)
  install (FILES "${CMAKE_CURRENT_BINARY_DIR}/Debug/${LOG4CXX_LIBRARY_NAME}${PROJECT_DEBUG_POSTFIX}.pdb" DESTINATION ${CMAKE_INSTALL_LIBDIR} CONFIGURATIONS Debug)
ENDIF()

PKG_CONFIG_APPEND_LIBS(log4cxx)
SETUP_PROJECT_FINALIZE()