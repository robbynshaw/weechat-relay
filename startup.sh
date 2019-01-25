#!/usr/bin/env ash

echo Starting a weechat session in the background...
su weechat
screen -S weechat -dm weechat
su root

echo Starting ssh daemon...

if [ ! -d $HOME/.ssh ]; then
    mkdir -p $HOME/.ssh
fi
/usr/local/bin/sshd.sh 
