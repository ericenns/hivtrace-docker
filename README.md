HIV-Trace Docker
================
HIV Trace is an application that identifies potential transmission clusters within a supplied FASTA file with an option to find potential links against the Los Alamos HIV Sequence Database.

how to build
------------
`docker build -t ericenns/hivtrace .`

how to download and install
---------------------------
`docker pull ericenns/hivtrace`

how to use
----------
`docker run --privileged=true -i -t -v <data_dir>:/host ericenns/hivtrace -i /host/<input> <options>`

software website
----------------
visit [HIV-Trace](https://github.com/veg/hivtrace) website for more information about usage and licensing.

support
-------
we do not provide support for the containerized software, only to aspects regarding the container itself
and its usage. For more information about the software usage, please refer to the publication.

license
-------
the license present in this repository refers only to the instructions necessary to create the containers, we do not provide or apply this repository license over the containerized software. Each software is distributed with a specific license selected by the developer group. For more information on that, please check the respective publication.

maintainers
-----------
* Eric Enns <eric.enns@gmail.com>
