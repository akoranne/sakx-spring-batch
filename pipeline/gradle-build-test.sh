#!/bin/bash

set -e # fail fast

# The src from the 'develop' branch, injected by concourse
srcdir=`pwd`/source-code-develop;

# change to the src directory
cd ${srcdir};

export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-8-openjdk-amd64/jre};

`which java`;
echo "The java version is: `java -version` ";

# do a clean build using gradle, and execute all tests.
# if everything succeeds, assemble the archive (will be in the build/libs)
./gradlew clean build test assemble;
