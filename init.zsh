(( ${+commands[asdf]} )) || return 1

() {
  builtin emulate -L zsh -o EXTENDED_GLOB

  local -r asdf_data=${ASDF_DATA_DIR:-${HOME}/.asdf}
  typeset -U path=(${asdf_data}/shims ${path})
  if [[ -z ${^fpath}/_asdf(#qN) ]]; then
    if [[ ! ${asdf_data}/completions/_asdf -nt ${commands[asdf]} ]]; then
      mkdir -p ${asdf_data}/completions
      asdf completion zsh >! ${asdf_data}/completions/_asdf
    fi
    fpath=(${asdf_data}/completions ${fpath})
  fi
}
