#!/bin/bash

pushd $(dirname $0) > /dev/null

premake=build/buildtools-premake/bin/premake.sh

for f in samples/*.lua
do
    $premake blueprint --file=$f
done

$premake gmake --file=build/premake5.lua --verbose
r=$?

if [[ $r -eq 0 ]]; then
    cd build/gmake

    make
    r=$?
fi

popd > /dev/null

exit $r
