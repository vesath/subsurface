#!/bin/bash

if [ -n $TRAVIS_BRANCH ] && [ "$TRAVIS_BRANCH" != "master" ] ; then
	export UPLOADTOOL_SUFFIX=$TRAVIS_BRANCH
fi

cd ${TRAVIS_BUILD_DIR}/../win32/subsurface

echo "Submitting the following Windows files for continuous build release:"
find . -name subsurface\*.exe*

# set up the release message to use
source ${TRAVIS_BUILD_DIR}/scripts/release-message.sh

# get the upload script
wget -c https://raw.githubusercontent.com/dirkhh/uploadtool/master/upload.sh

# don't upload the Subsurface build (we get that from the container based
# Windows build, just upload smtk2ssrf
cd ${TRAVIS_BUILD_DIR}/../win32/smtk-import
bash ../subsurface/upload.sh smtk2ssrf*.exe*
