if (BUILD_BASE)    
    add_subdirectory(boost)
    add_subdirectory(eigen)
    add_subdirectory(pythia8)
    add_subdirectory(tbb)
    add_subdirectory(xercesc)
elseif(BUILD_GEANT4)
    add_subdirectory(geant4)
elseif(BUILD_ROOT)    
    add_subdirectory(root)
endif()

