#!/bin/bash

cacheDir="/var/vcap/packages/tree/apt/cache"

debfiles=$(ls $cacheDir/archives/*.deb)
dpkg -i $debfiles
