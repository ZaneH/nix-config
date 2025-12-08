# Shorthand for editing configs
alias vz="$EDITOR ~/.zshrc"
alias vl="$EDITOR ~/.local.zsh"
alias va="$EDITOR ~/.alias.zsh"
alias vt="$EDITOR ~/.tmux.conf"

# Git shorthand
alias gcob="git checkout -b"
alias gcom="git checkout main"
alias gfom="git fetch origin main"
alias gpocb="git push origin $(git rev-parse --abbrev-ref HEAD)"
alias gpom="git push origin main"
alias grom="git rebase --interactive origin/main"

# Shorthand commands
alias k="clear"
alias sz="source ~/.zshrc"
alias v="$EDITOR ."
alias n="$EDITOR ."

# Utilities
alias pbcopy="xclip -selection clipboard"
alias yt3="yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0 --downloader aria2c --downloader-args '-c -j 3 -x 3 -s 3 -k 1M'"
alias e="emacs -nw"

# Fetch gitignore
dl-gitignore() {
  if [[ -z "$1" ]]; then
    echo "usage: dl-gitignore <language_name>"
    return 1
  fi

  curl -fsSL https://raw.githubusercontent.com/github/gitignore/main/${1}.gitignore
}

# Fetch license
dl-license() {
  if [[ -z "$1" ]]; then
    echo "usage: dl-license <license_name>"
    return 1
  fi

  local name="${1:l}"
  curl -fsSL "https://raw.githubusercontent.com/licenses/license-templates/master/templates/${name}.txt"
}