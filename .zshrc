if [ -f ~/.zshenv ]
then
  source ~/.zshenv
fi

# Homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt:$PATH
export PATH=/opt/homebrew/bin:$PATH

# ruby
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# node
export PATH=~/.nodenv/shims:$PATH
eval "$(nodenv init -)"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home/"

# direnv
eval "$(direnv hook zsh)"

# Go
export GOPATH=~/workspace
export GO111MODULE=on
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Android
export ANDROID_SDK_ROOT='/opt/homebrew/share/android-sdk'
export PATH="$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"
## repo
## https://android.googlesource.com/platform/frameworks/support/+/androidx-main/docs/onboarding.md#setup-linux-mac
export PATH=~/bin:$PATH
# Force repo to run with Python3
function repo() {
  command python3 ~/bin/repo $@
}
$HOME/.sdkman/bin/sdkman-init.sh

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship

bindkey -e
bindkey "^[[3~" delete-char

alias ls='ls -GF'
alias gls='gls --color'

alias bi='bundle install --path=vendor/bundle -j8'
alias be='bundle exec'

alias git_delete_merged_branches="git branch --merged | grep -v '*' | xargs -I % git branch -d %"

export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

# Javaのログで日本語が化けないようにする
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

export ENHANCD_FILTER=peco

source ~/.zshrc.zplug

autoload colors
colors

# cd って打たなくてもディレクトリ名入れるだけでcdする
setopt auto_cd

# you can get dirs list by cd -[tab]
setopt auto_pushd
setopt pushd_ignore_dups  # 重複を無視する

# rm * を実行時に確認
setopt rmstar_wait

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# すべてのバックグラウンドジョブを低優先度で実行を解除
unsetopt bg_nice


source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# historyの設定
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

## Completion configuration
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true

autoload -U compinit
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
compinit -u


# rbenv rehash after gem installed
function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}


# gibo の補完
_gibo()
{
    local_repo="$HOME/.gitignore-boilerplates"
    if [ -e "$local_repo" ]; then
        compadd -M 'm:{[:lower:]}={[:upper:]}' $( find "$local_repo" -name "*.gitignore" -exec basename \{\} .gitignore \; )
    fi
}
compdef _gibo gibo


# peco で history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function peco-src () {
  local selected_dir=$(ghq list -p | sed -e "s/\/Users\/$USER/~/" | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^[' peco-src

source /Users/mizoguche/Library/Preferences/org.dystroy.broot/launcher/bash/br

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
