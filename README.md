# BOSH Release for tree

This BOSH release includes a package for the `tree` executable; and a job that does nothing except install the tree package.

## Requirements

* A BOSH configured for AWS EC2 or OpenStack (Nova Networks), or bosh-lite.

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
templates/make_manifest warden
bosh -n deploy
```

For Openstack (Nova Networks):

```
templates/make_manifest openstack-nova
bosh -n deploy
```

For AWS EC2:

```
templates/make_manifest aws-ec2
bosh -n deploy
```

To see the tree command in action:

```
bosh ssh

# inside the VM:
/var/vcap/packages/tree/bin/tree /var/vcap/bosh
```