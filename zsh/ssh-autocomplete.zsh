h=()
if [[ -s ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -s ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ -d ~/.ssh/known_hosts.d ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts.d/* || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi