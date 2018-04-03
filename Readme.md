# Redis vvv utility

Redis utility for VVV

This utility will set up [Redis](https://redis.io/) on your [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Usage

In your `vvv-customy.yml` file add under `utilities`:

```yml
utilities:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
  redis:
    - redis
utility-sources:
  redis: https://github.com/dingo-d/redis-vvv-utility
```

The `core` utilities are there by default, and `redis` doesn't depend on them.

Once you add it, be sure you re-provision your VVV with `vagrant reload --provision`.
