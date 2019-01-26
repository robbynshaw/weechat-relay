# Weechat Relay

> Docker image for creating a persistent, ssh-able weechat session

## Notes

Permissions inside the ./var/bitlbee container need to be handled in a
specific way. The container runs as the 'bitlbee' user which has the 
following ids:

```sh
uid=1000(bitlbee) gid=65533(nogroup) groups=65533(nogroup),65533(nogroup)
```

To give that user permissions, try:

```sh
sudo chmod -R ug+rw bar/bitlbee
sudo chown -R myuser:65533 var/bitlbee
```

## Usage

A password is needed for the user. The best place for this is in a .env
file:

```
# ./.env
PASSWORD=yourpasswordhere
```

Then, from a remote terminal:

```sh
# If you mapped port 22 to 2222...
ssh -p 2222 -t root@domain screen -D -RR weechat

# Using mosh...
mosh root@domain --ssh"ssh -p 2222" -- screen -D -RR weechat
```
