# Dotfiles but better

This is a collection of my dotfiles, but rather than using Stow or symlinks, I use a simple script to prepend an include statement to the relevant config file.

This way, whenever I need a one-off change for a specific machine, I can just edit the config file directly, and it won't be overwritten by the script. Also, I don't end up with a bunch of machine-specific snippets in my .bashrc. Effectively, each new machine I set up using this snippet is starting with my custom defaults.

To make a change to the defaults, you edit the file in the dotfiles repo, and run the (not yet written) script to update the configuration. To make a change to the specific machine, just edit the dotfile directly, and you don't pollute your .bashrc with nonsense.

