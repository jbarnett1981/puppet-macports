macports
===============

[![Puppet Forge](http://img.shields.io/puppetforge/v/edestecd/macports.svg)](https://forge.puppetlabs.com/edestecd/macports)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with macports](#setup)
    * [What macports affects](#what-mobileconfig_profile-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with macports](#beginning-with-mobileconfig_profile)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Puppet Module for managing MacPorts

##Module Description

The macports module provides a few classes to manage MacPorts on OS X.  
These allow you to install the proper pkg for your version of OS X,  
as well as keep the ports tree up to date.

##Setup

###What macports affects

* Installation and Update of MacPorts via pkg installer from MacPorts site.
* Periodic update of MacPorts and ports tree with `port selfupdate`

###Setup Requirements

1. pluginsync needs to be enabled on agents
2. Xcode and the Xcode Command Line Tools need to be installed on agents
    * catalog compilation will fail with message if not installed
    * http://guide.macports.org/#installing.xcode
3. Need to Agree to Xcode license in Terminal on agents
    * sudo xcodebuild -license

###Beginning with macports

Only install latest MacPorts (you need it for package)

```puppet
class mysql::install {
  require macports

  package { 'mysql5-server':
    ensure   => installed,
    provider => macports,
  }
}
```

##Usage

###Install a specific version of MacPorts

```puppet
class { 'macports':
  version => '2.3.2',
}
```

###Install MacPorts and set to selfupdate weekly

```puppet
include macports
include macports::selfupdate
```

###Change the selfupdate schedule

```puppet
class { 'macports::selfupdate':
  update_period => daily,
}
```

##Reference

### Classes

* macports
* macports::selfupdate

##Limitations

This module has been built on and tested against Puppet 3.2.4 and higher.  
While I am sure other versions work, I have not tested them.

MacPorts is only supported on Apple Mac OS X.  
This module has been tested on 10.8 "Mountain Lion" and newer (including Yosemite).

No plans to support other versions (unless you add it :)..

##Development

Pull Requests welcome

##Contributors

Chris Edester (edestecd)
