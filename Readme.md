# Redis VVV extension

A Redis extension for VVV

This extension will set up [Redis](https://redis.io/) on your [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Usage

In your `config/config.yml` file add under `extensions`:

```yml
extensions:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
  redis:
    - redis

extension-sources:
  redis: 
    repo: https://github.com/dingo-d/redis-vvv-utility.git
    branch: master
```

### Versions

* redis
* redis-systemd

The systemd version will build redis with systemd support. To build with systemd support, you'll need systemd 
development libraries (such as libsystemd-dev on Debian/Ubuntu or systemd-devel on CentOS).

The `core` extensions are there by default, and `redis` doesn't depend on them.

Once you add it, be sure you re-provision your VVV with `vagrant up --provision`.
