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

FAQ
---

### How to configure asdf to work with the direnv installed with my system package manager?


If you're using your system's direnv instead of direnv installed via asdf,
follow these steps:

1. Uninstall any direnv installed with asdf.
2. Keep the asdf direnv plugin installed.
3. Make sure the ~/.config/direnv/lib/use_asdf.sh script exists.
4. Make sure your direnv .envrc files have `use asdf`.
5. Remove `zmodule asdf` from .zimrc or any asdf initialization from .zshrc.
6. Make sure you're initializing direnv during shell start-up, with the
   following line in your .zshrc or any other preferred way:
   ```
   source <(direnv hook zsh)
   ```

Basically you're using direnv to activate asdf this way. Since you're using the
system's direnv, that does not depend on asdf to work, it's a much simpler setup.

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
