#!/bin/bash -x

BUILDMODE=$1 # ALL or SRPM
RPMBUILDMODE="-ba" # "-ba" for ALL, "-bs" for SRPM

if [ "$BUILDMODE" == "SRPM" ]; then
    RPMBUILDMODE="-bs"
fi

ORIGDIR=`pwd`
cd ..
(mkdir -p rpmbuild && cd rpmbuild && mkdir -p SOURCES BUILD BUILDROOT i386 x86_64 SPECS)

cp ${ORIGDIR}/*.spec rpmbuild/SPECS/.
cp ${ORIGDIR}/*.gz rpmbuild/SOURCES/.
cp ${ORIGDIR}/debian/patches/*.patch rpmbuild/SOURCES/.
cp ${ORIGDIR}/debian/patches/{64bit,example_fix,series,verbose} rpmbuild/SOURCES/.

rpmbuild --define "_topdir %(pwd)/rpmbuild" \
  --define "_rpmdir %{_topdir}" \
  $RPMBUILDMODE rpmbuild/SPECS/flite.spec
