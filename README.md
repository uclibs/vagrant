## Introduction

A test/play virtual machine for [Open Monograph Press](http://pkp.sfu.ca/omp/). It should work on any operating system that supports VirtualBox and Vagrant.

This virtual machine **should not** be used in production.

## Prerequisites

Install the following prerequisites on your laptop or desktop:

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://www.vagrantup.com/)

## Setting up your virtual machine

1. `git clone -b omp-master https://github.com/pkp/vagrant.git` (or download the .zip/.tar version)
2. `cd vagrant`
3. `vagrant up`

When all the scripts have finished running, your virtual machine is ready for use.

## Accessing OMP

Point your browser at [http://localhost:8000/omp](http://localhost:8000/omp). The [OMP Documentation wiki](https://pkp.sfu.ca/wiki/index.php?title=OMP_Documentation) contains everything you need to know, except...
* The administrator account has username: admin password: admin

## Other details you might find useful

You can connect to the machine via ssh: `ssh -p 2222 vagrant@localhost` and log in with:
  - username: vagrant
  - password: vagrant

You won't normally need the following but just in case:

MySQL credentials:
  - username: root
  - password: omp

OMP database details:
  - database: omp
  - user: omp
  - password: omp

## Thanks

This Vagrant virtual machine is based on [Islandora Vagrant](https://github.com/Islandora-Labs/islandora_vagrant).
