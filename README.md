asdf
====

Initializes [asdf], installing it using git if not installed yet. Also, bypasses
the shims if you're using the [direnv plugin], as suggested by the plugin
[pro-tips].

Settings
--------

The path of `ASDF_DIR`, where asdf is installed, is checked among the usual
directories created by Homebrew or Pacman, or the default `${HOME}/.asdf`. You
can define a custom `ASDF_DIR` at the beginning of your .zshrc, before the
modules are initialized with `source ${ZIM_HOME}/init.zsh`:

    ASDF_DIR=/path/to/asdf_dir

FAQ
---

### Do do I install the [direnv plugin] to work with this module?

1. Run these commands:
   ```
   asdf plugin-add direnv
   asdf direnv setup --no-touch-rc-file --version latest
   ```
2. Make sure your .zshrc does not contain the following line:
   ```
   source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
   ```

### How to configure asdf to work with the direnv installed with my system package manager?

To use your system's direnv instead of direnv installed via asdf, follow these
steps:

1. Keep the asdf direnv plugin installed. You can install it with:
   ```
   asdf plugin-add direnv
   ```
2. Uninstall any direnv installed with asdf:
   ```
   asdf uninstall direnv
   ```
3. Make sure the ~/.config/direnv/lib/use_asdf.sh script exists. You can
   generate it with:
   ```
   asdf direnv setup --no-touch-rc-file --version system
   ```
4. Make sure your direnv .envrc files have `use asdf`.
5. Remove `zmodule asdf` from .zimrc or any asdf initialization from .zshrc.
6. Make sure you're initializing direnv during shell start-up, preferably with
   `zmodule dirvenv` in your .zimrc.

Basically you're using direnv to activate asdf this way. Since you're using the
system's direnv, that does not depend on asdf to work, it's a much simpler setup.

[asdf]: https://github.com/asdf-vm/asdf
[direnv plugin]: https://github.com/asdf-community/asdf-direnv
[pro-tips]: https://github.com/asdf-community/asdf-direnv/blob/master/README.md#pro-tips
