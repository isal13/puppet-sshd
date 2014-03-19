#isal13-sshd
==========

#####Table of Contents

1. [Overview](#Overview)
2. [How to Use](#How)

###Overview

This module will install, configure and run sshd.  It works with osfamily RedHat and Debian.

###How to Use

Using this module is simple, just include a line like this:

```include sshd```

or if you do not want the defaults, this:

```class{"sshd": permitrootlogin => 'yes', x11forwarding => 'yes'}```
