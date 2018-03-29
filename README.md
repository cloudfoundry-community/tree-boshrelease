# Example BOSH release packaging "tree" Debian package

This BOSH release project is an example of packaging an Ubuntu Debian package
and installing it via a `pre-start` script.

## Usage

This repository includes base manifests and operator files. They can be used for initial deployments and subsequently used for updating your deployments:

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=tree
git clone https://github.com/cloudfoundry-community/tree-boshrelease.git
bosh deploy tree-boshrelease/manifests/tree.yml
```

The `bosh deploy` command will run the `packages/tree/packaging` script in your BOSH environment, which will require egress Internet access to fetch the `apt-get install tree` package. If your BOSH environment is offline, you can use the pre-compile release:

```plain
bosh deploy tree-boshrelease/manifests/tree.yml \
  -o tree-boshrelease/manifests/operators/use-compiled-releases.yml
```

If your BOSH does not have Credhub/Config Server, then remember `--vars-store` to allow generation of passwords and certificates.

### Update

When new versions of `tree-boshrelease` are released the `manifests/tree.yml` file will be updated. This means you can easily `git pull` and `bosh deploy` to upgrade.

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=tree
cd tree-boshrelease
git pull
cd -
bosh deploy tree-boshrelease/manifests/tree.yml
```
