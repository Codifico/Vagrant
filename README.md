Codifico Vagrant Configuration for web development
==================================================

Installation
------------

```bash
git submodule add -b 0.2 --name vagrant git@bitbucket.org:codifico/vagrantconfiguration.git vagrant
```

```bash
cd vagrant && git pull
```

Configuration
-------------
```bash
cp vagrant/parameters.dist vagrant/parameters
```

Available parameters:

* ip - IP Address to assign to VM
* project - Project name to include in domains
* use_nfs - Use NFS (true/false) for Windows
* manifest_file - Puppet Manifest file symfony-standard-devtools-mysql.pp
* manifests_path - Puppet Manifest directory
* module_path - Puppet Modules directory

Known Issues:
=============

- Update apt-get database
