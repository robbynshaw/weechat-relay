# Weechat Relay

> Docker image for creating a persistent, ssh-able weechat session

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
ssh -p 2222 -t user@domain screen -D -RR weechat

# Using mosh...
mosh user@domain -- screen -D -RR weechat
```
