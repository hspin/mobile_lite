#!/bin/bash

DIR=$(pwd)

sudo docker run -p 8080:8080 -p 35729:35729 -v $DIR:/home/deployer/code/ -i -t me/wintersmith /bin/bash

