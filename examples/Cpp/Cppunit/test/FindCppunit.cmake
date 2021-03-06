#
# Find the CppUnit includes and library
#
# The cache variable CPPUNIT_ROOT (root directory of the Cppunit installation)
# should be set by passing argument or set as an environment variable.
#
# This module defines
# CPPUNIT_INCLUDE_DIRS, the directories containing heanders to be included.
# CPPUNIT_LIBRARIES, the libraries to link against to use CppUnit.
# CPPUNIT_DEBUG_LIBRARIES, the debug libraries to link against to use CppUnit.
# CPPUNIT_FOUND, If false, do not try to use CppUnit.

# also defined, but not for general use are
# CPPUNIT_INCLUDE_DIR, where to find header files.
# CPPUNIT_LIBRARY, where to find the CppUnit library.
# CPPUNIT_DEBUG_LIBRARY, where to find the CppUnit library in debug mode.

FIND_PATH(CPPUNIT_INCLUDE_DIR cppunit/TestCase.h
  $ENV{CPPUNIT_ROOT}/include
  ${CPPUNIT_ROOT}/include
  /usr/local/include
  /usr/include
)
mark_as_advanced(CPPUNIT_INCLUDE_DIR)

IF(WIN32)
  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
    ${CPPUNIT_INCLUDE_DIR}/../lib
    /usr/local/lib
    /usr/lib
  )
  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunitd
    ${CPPUNIT_INCLUDE_DIR}/../lib
    /usr/local/lib
    /usr/lib
)
ELSE(WIN32)
  # On unix system, debug and release have the same name
  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
    ${CPPUNIT_INCLUDE_DIR}/../lib
    /usr/local/lib
    /usr/lib
  )
  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunit
    ${CPPUNIT_INCLUDE_DIR}/../lib
    /usr/local/lib
    /usr/lib
  )
ENDIF(WIN32)

IF(CPPUNIT_INCLUDE_DIR)
  set(CPPUNIT_INCLUDE_DIRS ${CPPUNIT_INCLUDE_DIR})
  IF(CPPUNIT_LIBRARY)
    SET(CPPUNIT_FOUND "YES")
    SET(CPPUNIT_LIBRARIES ${CPPUNIT_LIBRARY} ${CMAKE_DL_LIBS})
    SET(CPPUNIT_DEBUG_LIBRARIES ${CPPUNIT_DEBUG_LIBRARY} ${CMAKE_DL_LIBS})
  ENDIF(CPPUNIT_LIBRARY)
ENDIF(CPPUNIT_INCLUDE_DIR)

