#! /bin/sh

if [-d /home/ec2-user/build ]; then
    sudo rm -rf /home/ec2-user/build/
    sudo mkdir /home/ec2-user/build/
fi
