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

### Do do I install the [direnv plugin] to work with this module?

1. Run this command:
   ```
   asdf plugin-add direnv
   ```
2. Do *not* run this command: `asdf direnv setup --shell zsh --version latest`
3. Only if you don't have direnv already installed with your system package
   manager, run this command:
   ```
   asdf install direnv latest
   ```

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
