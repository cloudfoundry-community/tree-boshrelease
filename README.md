BOSH Release for tree
=====================

This BOSH release includes an errand for running the `tree` executable.

Usage
-----

The `tree` errand is run:

```
$ bosh run errand tree
[stdout]
/var/vcap/jobs/tree
|-- bin
|   `-- run
|-- monit
`-- packages
    `-- tree -> /var/vcap/data/packages/tree...
```

To configure the path & arguments used for the `tree` command, add the following to the deployment manifest:

```yaml
properties:
  tree:
    path: /var/vcap/
    arguments: -L 4
```

Deploy the changes & run the errand:

```
$ bosh deploy
$ bosh run errand tree
[stdout]
/var/vcap/
|-- bosh
|   |-- agent.cert
|   |-- agent.json
|   |-- agent.key
|   |-- bin
|   |   |-- agent_client
|   |   |-- aws-rb
...
```

Installation
------------

To use this bosh release, first upload it to your bosh:

```
bosh upload release https://tree-boshrelease.s3.amazonaws.com/boshrelease-tree-2.tgz
```

To generate manifests, first fetch this repo:

```
git clone https://github.com/cloudfoundry-community/tree-boshrelease.git
cd tree-boshrelease
```

For [bosh-lite](https://github.com/cloudfoundry/bosh-lite), you can quickly create a deployment manifest & deploy a single VM with tree installed as a BOSH package:

```
templates/make_manifest warden
bosh -n deploy
```

For OpenStack (Nova Networks):

```
templates/make_manifest openstack-nova
bosh -n deploy
```

For AWS EC2:

```
templates/make_manifest aws-ec2
bosh -n deploy
```

For AWS VPC:

First create a stub for the `tree1` network to be used:

```yaml
networks:
  - name: tree1
    type: manual
    subnets:
    - name: external
      range: 10.10.0.64/27
      gateway: 10.10.0.65
      reserved:
      - 10.10.0.66 - 10.10.0.83
      cloud_properties:
        subnet: subnet-123456
        security_groups:
        - vpc-123456
```

```
templates/make_manifest aws my-network.yml
bosh -n deploy
```
