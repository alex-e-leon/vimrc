# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# NVM default config
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load antibody
source <(antibody init)

# Load antibody plugins
antibody bundle romkatv/powerlevel10k
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle lukechilds/zsh-better-npm-completion
# plugins to look at
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
# https://github.com/athityakumar/colorls
# https://github.com/zsh-users/zsh-syntax-highlighting
# + OhMyZsh plugins
# plugins=(git colored-man-pages frontend-search globalias safe-paste)

# User configuration

#Make sure that locale is set properly
export LC_ALL=en_AU.UTF-8

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# SET ls colors
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

#Setup grep color
export GREP_OPTIONS='--color=auto'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Load in .alias file
for file in ~/.{alias,}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh