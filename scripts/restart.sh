#!/bin/bash

killall /usr/local/bin/forever; sudo rm -rf ~/myblog /data/git/ ~/git/BadassCMS/ && cd ~/git && git clone https://github.com/drewswu/BadassCMS.git && cd BadassCMS && ./install.sh
