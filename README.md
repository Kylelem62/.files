# Dotfiles but better

This is a collection of my dotfiles, but rather than using Stow or symlinks, I use a simple script to prepend an include statement to the relevant config file.

This way, whenever I need a one-off change for a specific machine, I can just edit the config file directly, and it won't be overwritten by the script. Also, I don't end up with a bunch of machine-specific snippets in my .bashrc. Effectively, each new machine I set up using this snippet is starting with my custom defaults.

To make a change to the defaults, you edit the file in the dotfiles repo, and run the (not yet written) script to update the configuration. To make a change to the specific machine, just edit the dotfile directly, and you don't pollute your .bashrc with nonsense.

# Installation

```bash
cd ~
git clone git@github.com:Kylelem62/.files.git
cd .files
## Edit the files files here to your liking, then run
./setup.sh install
## This will exit with an error and creat a dotlist file.
## add/remove files from the dotlist file as desired.
./setup.sh install
## This will now install the files in the dotlist file.
## Apply any machine-specific changes to the files in your
## home directory, and apply general changes to the files
## in the dotfiles repo.
```
