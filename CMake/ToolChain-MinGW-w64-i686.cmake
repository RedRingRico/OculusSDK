SET(CMAKE_SYSTEM_NAME Windows)

# The compiler prefix can be set via -D COMPILER, otherwise the i686 version is
# used.  If a compiler is anything other than i686 or x86_64, i686 is used.
# Use either:
# i686
# x86_64
# to define the correct compiler to use
IF( ${COMPILER} MATCHES "x86_64" )
	set( COMPILER_PREFIX "x86_64-w64-mingw32" )
ELSEIF( ${COMPILER} MATCHES "i686" )
	set( COMPILER_PREFIX "i686-w64-mingw32" )
ELSE( ${COMPILER} MATCHES "x86_64" )
	set( COMPILER_PREFIX "i686-w64-mingw32" )
ENDIF( ${COMPILER} MATCHES "x86_64" )

find_program(CMAKE_C_COMPILER NAMES ${COMPILER_PREFIX}-gcc)
find_program(CMAKE_CXX_COMPILER NAMES ${COMPILER_PREFIX}-g++)
find_program(CMAKE_RC_COMPILER NAMES ${COMPILER_PREFIX}-windres)

SET( CMAKE_FIND_ROOT_PATH  /usr/${COMPILER_PREFIX} )
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
