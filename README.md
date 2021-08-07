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
