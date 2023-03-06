if (( ! ${+ASDF_DIR} )); then
  for ASDF_DIR in \
      {/usr/local,/opt/homebrew,/home/linuxbrew/.linuxbrew}/opt/asdf/libexec \
      /opt/asdf-vm \
      ${HOME}/.asdf
  do
    if [[ -e ${ASDF_DIR} ]] break
  done
fi
export ASDF_DIR

# Install using git if not already installed at ASDF_DIR
if [[ ! -e ${ASDF_DIR} ]]; then
  print -u2 -R "${ASDF_DIR} not found, installing asdf"
  command git clone -q https://github.com/asdf-vm/asdf.git ${ASDF_DIR} || return 1
  command git -C ${ASDF_DIR} checkout -q $(command git -C ${ASDF_DIR} describe --abbrev=0 --tags) -- || return 1
fi

path=(${ASDF_DIR}/bin ${path:#${ASDF_DIR}/bin})
fpath+=(${ASDF_DIR}/completions(FN))

# Don't add shims directory to the path if direnv plugin is installed
local asdf_data=${ASDF_DATA_DIR:-${HOME}/.asdf}
if [[ -e ${asdf_data}/installs/direnv ]]; then
  if (( ! ${+DIRENV_LOG_FORMAT} )) export DIRENV_LOG_FORMAT=$'\E[1mdirenv: %s\E[0m'
  alias direnv='asdf exec direnv'
  eval "$(direnv hook zsh)"
else
  path=(${asdf_data}/shims ${path:#${asdf_data}/shims})
fi
unset asdf_data

source ${ASDF_DIR}/lib/asdf.sh
