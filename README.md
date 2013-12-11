# BOSH Release for tree

## Usage

To use this bosh release, first upload it to your bosh:

```
bosh target BOSH_HOST
git clone https://github.com/cloudfoundry-community/tree-boshrelease.git
cd tree-boshrelease
bosh upload release releases/tree-1.yml
```

For [bosh-lite](https://github.com/cloudfoundry/bosh-lite), you can quickly create a deployment manifest:

```
cp examples/bosh-lite-cluster.yml local-cluster.yml
sed -i '' -e "s/DIRECTOR_UUID/$(bosh status | grep UUID | awk '{print $2}')/" local-cluster.yml
bosh deployment local-cluster.yml
bosh -n deploy
```
