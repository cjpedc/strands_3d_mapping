# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^debug|optimized|general$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(ekz_public_lib_CONFIG_INCLUDED)
  return()
endif()
set(ekz_public_lib_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(ekz_public_lib_SOURCE_PREFIX /home/tmrcv1/catkin_ws/src/strands_3d_mapping/ekz-public-lib)
  set(ekz_public_lib_DEVEL_PREFIX /home/tmrcv1/catkin_ws/src/strands_3d_mapping/build-ekz-public-lib-Desktop-Default/devel)
  set(ekz_public_lib_INSTALL_PREFIX "")
  set(ekz_public_lib_PREFIX ${ekz_public_lib_DEVEL_PREFIX})
else()
  set(ekz_public_lib_SOURCE_PREFIX "")
  set(ekz_public_lib_DEVEL_PREFIX "")
  set(ekz_public_lib_INSTALL_PREFIX /usr/local)
  set(ekz_public_lib_PREFIX ${ekz_public_lib_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'ekz_public_lib' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(ekz_public_lib_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/tmrcv1/catkin_ws/src/strands_3d_mapping/ekz-public-lib/src;/usr/include/opencv;/usr/include;/usr/include/pcl-1.7;/usr/include/eigen3;/usr/include/ni;/usr/include/vtk-5.8" STREQUAL "")
  set(ekz_public_lib_INCLUDE_DIRS "")
  set(_include_dirs "/home/tmrcv1/catkin_ws/src/strands_3d_mapping/ekz-public-lib/src;/usr/include/opencv;/usr/include;/usr/include/pcl-1.7;/usr/include/eigen3;/usr/include/ni;/usr/include/vtk-5.8")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir}" STREQUAL "include")
      get_filename_component(include "${ekz_public_lib_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'ekz_public_lib' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Johan Ekekrantz <ekz@kth.se>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'ekz_public_lib' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/tmrcv1/catkin_ws/src/strands_3d_mapping/ekz-public-lib/${idir}'.  Ask the maintainer 'Johan Ekekrantz <ekz@kth.se>' to fix it.")
    endif()
    _list_append_unique(ekz_public_lib_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "frameinput_ekzpublic;FrameMatcher_ekzpublic;TransformationFilter_ekzpublic;core_ekzpublic;map3d_ekzpublic;RGBDSegmentation_ekzpublic;FeatureExtractor_ekzpublic;FeatureDescriptor_ekzpublic;mygeometry_ekzpublic;/usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_nonfree.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8;/usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8;optimized;/usr/lib/libpcl_common.so;debug;/usr/lib/libpcl_common.so;optimized;/usr/lib/libpcl_kdtree.so;debug;/usr/lib/libpcl_kdtree.so;optimized;/usr/lib/libpcl_octree.so;debug;/usr/lib/libpcl_octree.so;optimized;/usr/lib/libpcl_search.so;debug;/usr/lib/libpcl_search.so;optimized;/usr/lib/libpcl_surface.so;debug;/usr/lib/libpcl_surface.so;optimized;/usr/lib/libpcl_sample_consensus.so;debug;/usr/lib/libpcl_sample_consensus.so;optimized;/usr/lib/libpcl_io.so;debug;/usr/lib/libpcl_io.so;optimized;/usr/lib/libpcl_filters.so;debug;/usr/lib/libpcl_filters.so;optimized;/usr/lib/libpcl_features.so;debug;/usr/lib/libpcl_features.so;optimized;/usr/lib/libpcl_keypoints.so;debug;/usr/lib/libpcl_keypoints.so;optimized;/usr/lib/libpcl_registration.so;debug;/usr/lib/libpcl_registration.so;optimized;/usr/lib/libpcl_segmentation.so;debug;/usr/lib/libpcl_segmentation.so;optimized;/usr/lib/libpcl_recognition.so;debug;/usr/lib/libpcl_recognition.so;optimized;/usr/lib/libpcl_visualization.so;debug;/usr/lib/libpcl_visualization.so;optimized;/usr/lib/libpcl_people.so;debug;/usr/lib/libpcl_people.so;optimized;/usr/lib/libpcl_outofcore.so;debug;/usr/lib/libpcl_outofcore.so;optimized;/usr/lib/libpcl_tracking.so;debug;/usr/lib/libpcl_tracking.so;optimized;/usr/lib/libpcl_apps.so;debug;/usr/lib/libpcl_apps.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/usr/lib/x86_64-linux-gnu/libboost_iostreams.so;/usr/lib/x86_64-linux-gnu/libboost_serialization.so;/usr/lib/x86_64-linux-gnu/libboost_chrono.so;/usr/lib/x86_64-linux-gnu/libpthread.so;optimized;/usr/lib/x86_64-linux-gnu/libqhull.so;debug;/usr/lib/x86_64-linux-gnu/libqhull.so;/usr/lib/libOpenNI.so;optimized;/usr/lib/x86_64-linux-gnu/libflann_cpp_s.a;debug;/usr/lib/x86_64-linux-gnu/libflann_cpp_s.a;/usr/lib/libvtkCommon.so.5.8.0;/usr/lib/libvtkFiltering.so.5.8.0;/usr/lib/libvtkImaging.so.5.8.0;/usr/lib/libvtkGraphics.so.5.8.0;/usr/lib/libvtkGenericFiltering.so.5.8.0;/usr/lib/libvtkIO.so.5.8.0;/usr/lib/libvtkRendering.so.5.8.0;/usr/lib/libvtkVolumeRendering.so.5.8.0;/usr/lib/libvtkHybrid.so.5.8.0;/usr/lib/libvtkWidgets.so.5.8.0;/usr/lib/libvtkParallel.so.5.8.0;/usr/lib/libvtkInfovis.so.5.8.0;/usr/lib/libvtkGeovis.so.5.8.0;/usr/lib/libvtkViews.so.5.8.0;/usr/lib/libvtkCharts.so.5.8.0")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^debug|optimized|general$")
    list(APPEND ekz_public_lib_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND ekz_public_lib_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND ekz_public_lib_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/tmrcv1/catkin_ws/src/strands_3d_mapping/build-ekz-public-lib-Desktop-Default/devel/lib;/home/tmrcv1/catkin_ws/devel/lib;/opt/ros/indigo/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(ekz_public_lib_LIBRARY_DIRS ${lib_path})
      list(APPEND ekz_public_lib_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'ekz_public_lib'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND ekz_public_lib_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(ekz_public_lib_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${ekz_public_lib_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 ekz_public_lib_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${ekz_public_lib_dep}_FOUND)
      find_package(${ekz_public_lib_dep} REQUIRED)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${ekz_public_lib_dep} REQUIRED ${depend_list})
  endif()
  _list_append_unique(ekz_public_lib_INCLUDE_DIRS ${${ekz_public_lib_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(ekz_public_lib_LIBRARIES ${ekz_public_lib_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${ekz_public_lib_dep}_LIBRARIES})
  _list_append_deduplicate(ekz_public_lib_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(ekz_public_lib_LIBRARIES ${ekz_public_lib_LIBRARIES})

  _list_append_unique(ekz_public_lib_LIBRARY_DIRS ${${ekz_public_lib_dep}_LIBRARY_DIRS})
  list(APPEND ekz_public_lib_EXPORTED_TARGETS ${${ekz_public_lib_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${ekz_public_lib_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
