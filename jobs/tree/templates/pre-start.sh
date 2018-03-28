#!/bin/bash

cacheDir="/var/vcap/packages/tree/apt/cache"
installDir="/var/vcap/packages/tree/apt/root"

debfiles=$(ls $cacheDir/archives/*.deb)
for debfile in ${debfiles[@]}; do
  dpkg -x $debfile $installDir
done

cp /var/vcap/jobs/tree/bin/runtime.env /etc/profile.d/01-tree.sh
chmod 644 /etc/profile.d/01-tree.sh