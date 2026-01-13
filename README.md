asdf
====

Initializes [asdf].

Settings
--------

The `ASDF_DATA_DIR` used by asdf is `${HOME}/.asdf` by default. You can define a
custom `ASDF_DATA_DIR` at the beginning of your `~/.zshrc`, before the modules
are initialized with `source ${ZIM_HOME}/init.zsh`:

    export ASDF_DATA_DIR=/path/to/asdf_data_dir

Requirements
------------

[asdf] >= 0.16.0 must be installed.

[asdf]: https://github.com/asdf-vm/asdf
