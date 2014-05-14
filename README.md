# VagrantPlugins::MRO

This is a solution for getting machine-readable global status output
from Vagrant, until this functionality is implemented in Vagrant itself.

## Installation

    vagrant plugin install vagrant-mro

## Usage

    vagrant mro

    # output:
    # id, name, state

    915bee0,default,saved

## Todo

* Should probably use the machine-readable UI format
* Or, fix this in vagrant itself by splitting the command output from
  its data in the global-status plugin
