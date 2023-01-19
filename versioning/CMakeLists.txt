message(STATUS "Creating .version files")

file(WRITE "$ENV{TARGET_DIR}/versioning/base-deps.versions" "${_acts_base_versions}")
file(WRITE "$ENV{TARGET_DIR}/versioning/geant4.version" "${_acts_geant4_version}")
file(WRITE "$ENV{TARGET_DIR}/versioning/root.version" "${_acts_geant4_version}")

