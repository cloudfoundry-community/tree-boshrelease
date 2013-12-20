# BOSH Release for tree

This BOSH release includes a package for the `tree` executable; and a job that does nothing except install the tree package.

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
templates/make_manifest_warden
bosh -n deploy
```

To see the tree command in action:

```
bosh ssh

# inside the VM:
/var/vcap/packages/tree/bin/tree /var/vcap/bosh
```