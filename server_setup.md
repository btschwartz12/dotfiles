Ubuntu 22.04 Full Server Setup.

This assumes you have a fresh Ubuntu 22.04 server with root SSH access.

### 1. Setup new user

```bash
$ sudo adduser bliss
# make a strong password
```

Then allow them to do `sudo`:

```bash
$ sudo usermod -aG sudo bliss
$ sudo visudo
# add the following line to the end of the file
bliss ALL=(ALL) NOPASSWD: ALL
```

And set the hostname, if you want:

```bash
$ sudo hostnamectl set-hostname blissbox
$ sudo vim /etc/hosts
# add the following line to the end of the file
<your ip> blissbox
127.0.0.1 blissbox

# and then 
$ sudo systemctl restart systemd-hostnamed
```

### 2. Setup SSH

On your local machine:

```bash
$ ssh-keygen -t ed25519 -C "bissbox"
# save to a file ~/.ssh/id_blissbox
# set a passphrase
```

Now, copy `~/.ssh/id_blissbox.pub` and on the server:

```bash
# switch to the new user
$ su bliss
$ mkdir -p ~/.ssh
$ chmod 700 ~/.ssh
$ touch ~/.ssh/authorized_keys
$ chmod 600 ~/.ssh/authorized_keys
$ vim ~/.ssh/authorized_keys
# now paste the public key into the file
```

Now modify the `/etc/ssh/sshd_config` file: 

```bash
# make sure to have these set
Port 2419 # or whatever port you want
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

Then set up `ufw`:

```bash
$ sudo ufw enable
$ sudo ufw allow 2810/tcp
```

Then restart the SSH service:

```bash

Now, back on your local machine, add this to your `~/.ssh/config` file:

```bash
Host blissboxV1
    HostName <your_server_ip>
    User bliss
    IdentityFile ~/.ssh/id_blissbox
    Port 2419
```

Now, you should be able to SSH into your server:

```bash
$ ssh blissboxV1
```

#### Adding to GitHub

On the server, make another SSH key:

```bash
$ ssh-keygen -t ed25519 -C "github"
# save to a file ~/.ssh/id_github
```

Make sure to add `~/.ssh/id_github.pub` to your GitHub account.

Now, make a `~/.ssh/config` file on the server and add this:

```bash
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_github
  IdentitiesOnly yes
```

### 3. Setup Docker

Follow the installation instructions [here](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

Once installed, add your user to the `docker` group:

```bash
$ sudo usermod -aG docker bliss
```

You may need to log out and back in for this to take effect.

### 4. Install OMZ

First, get `zsh`:

```bash
$ sudo apt update
$ sudo apt install -y zsh
$ chsh -s $(which zsh) # you need password
```

Now, install `omz`:

```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 5. Setup dotfiles

```bash
$ git clone git@github.com:btschwartz12/dotfiles.git
$ cp ~/dotfiles/.zshrc ~/.zshrc
$ sudo apt install lolcat boxes
$ omz reload
```

### 6. Install helpful tools

```bash
$ sudo apt update && sudo apt install btop -y
$ sudo apt install -y bat
$ mkdir -p ~/.local/bin
$ ln -s /usr/bin/batcat ~/.local/bin/bat




bpytop (or btop?)

