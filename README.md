asdf
====

Initializes [asdf], installing it using git if not installed yet. Also, bypasses
the shims if you're using the [direnv plugin], as suggested by the plugin
[pro-tips].

Settings
--------

The path of `ASDF_DIR`, where asdf is installed, is checked among the usual
directories created by Homebrew or Pacman, or the default `${HOME}/.asdf`. You
can define `ASDF_DIR`, before where this module is initialized, to customize
it's path:

    ASDF_DIR=/path/to/asdf_dir

[asdf]: https://github.com/asdf-vm/asdf
[direnv plugin]: https://github.com/asdf-community/asdf-direnv
[pro-tips]: https://github.com/asdf-community/asdf-direnv/blob/master/README.md#pro-tips

Notice
--------
In the [setup section](https://github.com/asdf-community/asdf-direnv#setup) of asdf-direnv, you might find this instruction

    asdf direnv setup --shell zsh --version system  

You do not have to run this command and should not, as it appends your `zshrc` with 

    source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
    
which has been [taken care by this plugin](https://github.com/zimfw/asdf/blob/37c681924efb969b452bc0c6f71fc885061aee94/init.zsh#L26) already. 
