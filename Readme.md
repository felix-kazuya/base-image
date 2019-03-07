# Base Image

Base Image based on Ubuntu, containing Ansible.

## Getting Started

This Image is intented to be used as a base image and not for stand alone.

### Prerequisities

### Usage

#### Build
```shell
docker build . --tag felixkazuyadev/base-image:latest --build-arg VERSION=ubuntu --build-arg TAG=16.04
```


#### Container Parameters

Start a shell to examine the image:

```shell
docker run --rm -it felixkazuya/base-image bash
```

#### Useful File Locations

* `/opt/ansible/` - Ansible installation directory

## Contributing

