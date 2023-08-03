# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf-tab zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -------------------------------------------------------------------
# Dart & Flutter
# -------------------------------------------------------------------

export PATH="$PATH:$HOME/.flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

alias dt='dart'
alias dtcr='dart create'
alias dtp='dart pub'
alias dtpa='dart pub add'
alias dtpg='dart pub get'
alias dtr='dart run'
alias dtv='dart --version'

alias fl='flutter'
alias flcr='flutter create'
alias flcf='flutter config'
alias fldr='flutter doctor'
alias flup='flutter upgrade'
alias flp='flutter pub'
alias flpa='flutter pub add'
alias flpg='flutter pub get'
alias flv='flutter --version'

# -------------------------------------------------------------------
# Docker
# -------------------------------------------------------------------

alias dk='docker'

# -------------------------------------------------------------------
# kubectl
# -------------------------------------------------------------------

alias k='kubectl'
alias kcf='kubectl config'

alias kdct='kubectl config delete-context'
alias kgct='kubectl config get-contexts'
alias krct='kubectl config rename-context'
alias ksct='kubectl config set-context'
alias kuct='kubectl config use-context'

alias kcns='kubectl create namespace'
alias kgns='kubectl get namespace'
alias ksns='kubectl config set-context --current --namespace'

alias kexpl='kubectl explain'

alias krr='kubectl rollout restart'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gai='git add -i'

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbnm='git branch --no-merged'
alias gbnma='git branch --no-merged --all'
alias gbnmr='git branch --no-merged --remotes'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gcf='git config'
alias gcfl='git config --list'
alias gcfll='git config --list --local'
alias gcfuser='git config user.email "scintillavoy@gmail.com" && git config user.name "Dongyoung Moon"'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gccc='git clean -xdf'

alias gcl='git clone'

alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gcd='git commit --amend'
alias gcda='git commit --amend --all'
alias gcdm='git commit --amend --message'
alias gcdam='git commit --amend --all --message'
alias gce='git commit --allow-empty'
alias gcem='git commit --allow-empty --message'

alias gf='git fetch'
alias gfp='git fetch --prune'

alias gi='git init'

alias glg='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cr) %C(bold blue)<%an>" --abbrev-commit --graph'
alias glga='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cr) %C(bold blue)<%an>" --abbrev-commit --graph --all'
alias glgA='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cr) %C(bold blue)<%an>" --abbrev-commit --graph $(git rev-list -g --all)'
alias glgr='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cr) %C(bold blue)<%an>" --abbrev-commit --reverse'
alias glgt='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%ci) %C(bold blue)<%an>" --abbrev-commit --graph'
alias glgta='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%ci) %C(bold blue)<%an>" --abbrev-commit --graph --all'
alias glgtA='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%ci) %C(bold blue)<%an>" --abbrev-commit --graph $(git rev-list -g --all)'
alias glgtr='git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%ci) %C(bold blue)<%an>" --abbrev-commit --reverse'
alias glgT='TZ=UTC0 git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cd) %C(bold blue)<%an>" --abbrev-commit --graph --date=iso-local'
alias glgTa='TZ=UTC0 git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cd) %C(bold blue)<%an>" --abbrev-commit --graph --all --date=iso-local'
alias glgTA='TZ=UTC0 git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cd) %C(bold blue)<%an>" --abbrev-commit --graph $(git rev-list -g --all) --date=iso-local'
alias glgTr='TZ=UTC0 git log --pretty=format:"%C(auto)%h%d %s %Cgreen(%cd) %C(bold blue)<%an>" --abbrev-commit --reverse --date=iso-local'

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmff='git merge --ff-only'
alias gmnf='git merge --no-ff'
alias gms='git merge --skip'

alias gpl='git pull'
alias gplff='git pull --ff-only'

alias gps='git push'
alias gpsoc='git push origin HEAD'
alias gpsuoc='git push -u origin HEAD'
alias gpsd='git push --delete'
alias gpst='git push --tags'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase --reset-author-date'
alias grbi='git rebase --interactive'
alias grbs='git rebase --skip'

alias grs='git reset'
alias grsl='git reset HEAD~'

alias grst='git restore'
alias grsts='git restore --staged'

alias grmt='git remote'
alias grmta='git remote add'
alias grmtr='git remote rm'
alias grmtv='git remote -v'

alias grv='git revert'
alias grvnc='git revert --no-commit'

alias gs='git status'

alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstps='git stash push --include-untracked'
alias gstpss='git stash push --staged'
alias gsts='git stash show'

alias gt='git tag'
alias gtd='git tag --delete'

# -------------------------------------------------------------------
# Completion system
# -------------------------------------------------------------------

# fzf and fzf-tab
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# Switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

export FZF_DEFAULT_OPTS="--bind=tab:accept --no-mouse"
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
zstyle ':fzf-tab:*' accept-line enter
bindkey '^[OA' fzf-history-widget # Up arrow
bindkey '^[[A' fzf-history-widget # Up arrow
bindkey '^[OB' fzf-tab-complete   # Down arrow
bindkey '^[[B' fzf-tab-complete   # Down arrow
bindkey '^@' fzf-tab-complete     # Ctrl + Space

# zsh-autosuggestions
bindkey '^I' autosuggest-accept   # Tab
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# Move forward-char from accept widgets to partial accept widgets
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# Additional completions
[[ ! -f ~/.completions.zsh ]] || source ~/.completions.zsh

# -------------------------------------------------------------------
# Miscellaneous
# -------------------------------------------------------------------

alias g++='g++ -std=c++17'
alias sss='sudo shutdown -s'

# history
export HISTSIZE=999999
export SAVEHIST=$HISTSIZE

# -------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
