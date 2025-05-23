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

# Load completions before compinit is called in `oh-my-zsh.sh`.
FPATH="$HOME/.zsh-functions:$(brew --prefix)/share/zsh/site-functions:$FPATH"

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

# ------------------------------------------------------------------------------
# ArgoCD
# ------------------------------------------------------------------------------

alias ag='argocd'
alias aga='argocd app'
alias agadiff='argocd app diff'
alias agals='argocd app list'
alias agasync='argocd app sync'
alias agctx='argocd context'
alias agp='argocd proj'
alias agpiter='argocd_proj_iter'
agpdiff() { argocd_proj_iter diff $1 --refresh }
alias agpls='argocd proj list'
alias agpsync='argocd app sync --project'

# ------------------------------------------------------------------------------
# Dart & Flutter
# ------------------------------------------------------------------------------

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
alias fldrv='flutter doctor -v'
alias flup='flutter upgrade'
alias flp='flutter pub'
alias flpa='flutter pub add'
alias flpg='flutter pub get'
alias flv='flutter --version'

# ------------------------------------------------------------------------------
# Docker
# ------------------------------------------------------------------------------

alias dk='docker'
alias dka='docker attach'
alias dkstr='docker start'

alias dkc='docker container'
alias dkcls='docker container ls'
alias dkclsa='docker container -a'
alias dkcrmA='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

alias dki='docker image'
alias dkils='docker image ls'
alias dkirm='docker image rm'
alias dkirmA='docker image rm $(docker images -q)'

alias dkpl='docker pull'
alias dkps='docker push'
alias dkt='docker tag'

alias dkcomp='docker-compose'
alias dkcompup='docker-compose up'
alias dkcompupwait='docker-compose up --wait'
alias dkcompdown='docker-compose down'
alias dkcompdownv='docker-compose down -v'

# ------------------------------------------------------------------------------
# kubectl
# ------------------------------------------------------------------------------

alias k='kubectl'
alias kcf='kubectl config'

alias kdcl='kubectl config delete-cluster'
alias kgcl='kubectl config get-clusters'

alias kdctx='kubectl config delete-context'
alias kgctx='kubectl config get-contexts'
alias krctx='kubectl config rename-context'
alias ksctx='kubectl config set-context'
alias kuctx='kubectl config use-context'

alias kcns='kubectl create namespace'
alias kgns='kubectl get namespace'
alias ksns='kubectl config set-context --current --namespace'

alias kdbg='kubectl debug'
alias kexpl='kubectl explain'
alias kg='kubectl get'
alias kpf='kubectl port-forward'
alias kpx='kubectl proxy'
alias krr='kubectl rollout restart'

# ------------------------------------------------------------------------------
# Git
# ------------------------------------------------------------------------------

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gai='git add -i'

alias gb='git branch'
alias gba='git branch --all'
alias gbr='git branch --remotes'
alias gbnm='git branch --no-merged'
alias gbanm='git branch --all --no-merged'
alias gbrnm='git branch --remotes --no-merged'
alias gbv='git branch -vv'
alias gbva='git branch -vv --all'
alias gbvr='git branch -vv --remotes'
alias gbvnm='git branch -vv --no-merged'
alias gbvanm='git branch -vv --all --no-merged'
alias gbvrnm='git branch -vv --remotes --no-merged'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbm='git branch --move'
alias gbM='git branch --move --force'

alias gbak='git commit --allow-empty -m "Backup commit (staged)" &&
git add -A &&
git commit --allow-empty -m "Backup commit (unstaged)" &&
git push --force-with-lease &&
git reset HEAD~ &&
git reset HEAD~ --soft'

alias gbs='git bisect'
alias gbss='git bisect start'
alias gbssf='git bisect start --first-parent'
alias gbsg='git bisect good'
alias gbsb='git bisect bad'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect run'
alias gbsrp='git bisect replay'
alias gbsrs='git bisect reset'
alias gbsl='git bisect log'
alias gbssk='git bisect skip'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcoB='git checkout -B'
alias gcol='git checkout -'

alias gcf='git config'
alias gcfl='git config --list'
alias gcfll='git config --list --local'
alias gcfuser='git config user.email "scintillavoy@gmail.com" && git config user.name "Dongyoung Moon"'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gccc='git reset --hard && git clean -df'
alias gcccx='git reset --hard && git clean -xdf'
alias gcccb='delete_merged_branches'

alias gcl='git clone'

alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gcd='git commit --amend'
alias gcda='git commit --amend --all'
alias gcdm='git commit --amend --message'
alias gcdam='git commit --amend --all --message'
alias gcdned='git commit --amend --no-edit'
alias gcdneda='git commit --amend --no-edit --all'
alias gce='git commit --allow-empty'
alias gcem='git commit --allow-empty --message'

alias gf='git fetch'
alias gfp='git fetch --prune'

alias gi='git init'

alias gl='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph'
alias gla='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --all'
alias glA='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph $(git rev-list -g --all)'
alias glr='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --reverse'
alias glu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph @{upstream}'

alias glf='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --first-parent'
alias glfu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --first-parent @{upstream}'
alias glft='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --first-parent'
alias glftu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --first-parent @{upstream}'
alias glftv='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --first-parent'
alias glftvu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --first-parent @{upstream}'
alias glfv='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --first-parent'
alias glfvu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --first-parent @{upstream}'

alias glt='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph'
alias glta='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph --all'
alias gltA='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph $(git rev-list -g --all)'
alias gltr='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --reverse'
alias gltu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an" --graph @{upstream}'
alias gltv='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph'
alias gltva='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --all'
alias gltvA='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph $(git rev-list -g --all)'
alias gltvr='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+8))%.*},${$((COLUMNS/3.4+8))%.*})%C(auto)%b" --reverse'
alias gltvu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph @{upstream}'

alias glv='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph'
alias glva='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph --all'
alias glvA='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph $(git rev-list -g --all)'
alias glvr='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+8))%.*},${$((COLUMNS/3.4+8))%.*})%C(auto)%b" --reverse'
alias glvu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%<|($((COLUMNS/3.4+5)))%D %<|($((COLUMNS/1.15-23)),trunc)%s %Cgreen%cd %C(auto)%h %C(bold blue)%<|(-1,trunc)%an%n%w(0,${$((COLUMNS/3.4+6))%.*},${$((COLUMNS/3.4+6))%.*})%C(auto)%b" --graph @{upstream}'

alias glg='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph'
alias glga='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --all'
alias glgA='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph $(git rev-list -g --all)'
alias glgr='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --reverse'
alias glgu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph @{upstream}'

alias glgf='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --first-parent'
alias glgfu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --first-parent @{upstream}'
alias glgft='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --first-parent'
alias glgftu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --first-parent @{upstream}'
alias glgftv='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --first-parent'
alias glgftvu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --first-parent @{upstream}'
alias glgfv='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --first-parent'
alias glgfvu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --first-parent @{upstream}'

alias glgt='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph'
alias glgta='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph --all'
alias glgtA='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph $(git rev-list -g --all)'
alias glgtr='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --reverse'
alias glgtu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an" --graph @{upstream}'
alias glgtv='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph'
alias glgtva='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --all'
alias glgtvA='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph $(git rev-list -g --all)'
alias glgtvr='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --reverse'
alias glgtvu='TZ=UTC0 git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph @{upstream}'

alias glgv='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph'
alias glgva='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph --all'
alias glgvA='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph $(git rev-list -g --all)'
alias glgvr='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --reverse'
alias glgvu='git log --date=format-local:"%y-%m-%d %H:%M" --format="%C(auto)%h%d %s %Cgreen%cd %C(bold blue)%an%n%w(0,2,2)%C(auto)%b" --graph @{upstream}'

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmff='git merge --ff-only'
alias gmnff='git merge --no-ff'
alias gmnffnc='git merge --no-ff --no-commit'
alias gmdry='git merge --no-ff --no-commit'
alias gmsk='git merge --skip'

alias gpl='git pull'
alias gplff='git pull --ff-only'
alias gplnff='git pull --no-ff'

alias gps='git push'
alias gpsoc='git push origin HEAD'
alias gpsuoc='git push -u origin HEAD'
alias gpsd='git push --delete'
alias gpsdo='git push --delete origin'
alias gpst='git push --tags'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase --reset-author-date'
alias grbdi='git rebase --reset-author-date --interactive'
alias grbi='git rebase --interactive'
alias grbsk='git rebase --skip'

alias grs='git reset'
alias grss='git reset --soft'
alias grsh='git reset --hard'
alias grsl='git reset HEAD~'
alias grssl='git reset --soft HEAD~'
alias grshl='git reset --hard HEAD~'
alias grsu='git reset @{upstream}'
alias grssu='git reset --soft @{upstream}'
alias grshu='git reset --hard @{upstream}'

alias grst='git restore'
alias grsts='git restore --staged'

alias grmt='git remote'
alias grmta='git remote add'
alias grmtr='git remote rm'
alias grmtv='git remote -v'
alias grmtsu='git remote set-url'
alias grmtgu='git remote get-url'

alias groot='cd "$(git rev-parse --show-toplevel)"'

alias grv='git revert'
alias grvnc='git revert --no-commit'
alias grvdry='git revert --no-commit'

alias gs='git status'

alias gsh='git show'

alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstps='git stash push --include-untracked'
alias gstpss='git stash push --staged'
alias gsts='git stash show'

alias gt='git tag'
alias gtd='git tag --delete'
alias gtr='git ls-remote --tags'

alias gui='git update-index'
alias guiskw='git update-index --skip-worktree'
alias guinskw='git update-index --no-skip-worktree'

# ------------------------------------------------------------------------------
# Rust & Cargo
# ------------------------------------------------------------------------------

alias cg='cargo'
alias cga='cargo add'
alias cgb='cargo build'
alias cgc='cargo check'
alias cgd='cargo doc'
alias cgi='cargo init'
alias cgn='cargo new'
alias cgpub='cargo publish'
alias cgr='cargo run'
alias cgt='cargo test'
alias cgup='cargo update'
alias cgv='cargo --version'

alias rsc='rustc'
alias rscv='rustc --version'

alias rsup='rustup'
alias rsupd='rustup doc'
alias rsupup='rustup update'
alias rsupv='rustup --version'

# ------------------------------------------------------------------------------
# mise
# ------------------------------------------------------------------------------

eval "$($HOME/.local/bin/mise activate zsh)"

alias m='mise'
alias mi='mise install'
alias mls='mise ls'
alias mlsr='mise ls-remote'
alias mr='mise run'
alias mreg='mise registry'
alias mug='mise use --global'
alias mui='mise uninstall'
alias mup='mise upgrade'
alias mx='mise exec'

# ------------------------------------------------------------------------------
# Completion system
# ------------------------------------------------------------------------------

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

# Load completions after compinit is called.
[ -f ~/.completions.zsh ] && source ~/.completions.zsh

# ------------------------------------------------------------------------------
# Miscellaneous
# ------------------------------------------------------------------------------

alias g++='g++ -std=c++20'
alias sss='sudo shutdown -s'
alias jspp='json_pp -json_opt=pretty,utf8'

export PATH="$PATH:$HOME/.dotfiles/scripts"

# Go
export PATH="$PATH:$HOME/go/bin"

# history
export HISTSIZE=999999
export SAVEHIST=$HISTSIZE

# ------------------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
