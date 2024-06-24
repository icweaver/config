# Aliases
alias ..="cd .."
alias bkg="dconf dump / > ~/projects/config/gnome_backup.dconf"
alias bkx="cp -r ~/.config/xfce4 ~/projects/config/"
alias bsh="nvim ~/.bashrc"
alias cr="cargo run"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gl="git log --graph --abbrev-commit"
alias gp="git pull"
alias gpu="git push -u origin"
alias gr="git remote -v"
alias gs="git status"
alias gu="git commit -am 'up'; git push"
alias j="julia"
alias l="ls -CF"
alias la="ls -A"
alias ldg="dconf load / < ~/projects/config/gnome_backup.dconf"
alias ldx="cp -r ~/projects/config/xfce4 ~/.config/"
alias ll="ls -alF"
alias ls="ls --color=auto"
alias ma="mm activate ~/.julia/environments/py/.CondaPkg/env"
alias mad="mm deactivate"
alias mm="micromamba"
alias n="nvim"
alias ni="nvim ~/.config/nvim/init.lua"
alias o="xdg-open"
alias pl='julia -e "using Pluto; Pluto.run(auto_reload_from_file=true)"'
alias rm="rm -i"
alias src="source ~/.bashrc"
alias xclip="xclip -selection c"

# Environment variables
export PATH="$HOME/.local/bin/nvim-linux64/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL=$(which nvim)
export EDITOR=$(which nvim)

# Useful functions
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
case ":$PATH:" in
    *:/home/mango/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/mango/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac
# <<< juliaup initialize <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/mango/.julia/artifacts/7973f2c7725e2d0eef7a95159454c4145f0945a2/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/mango/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Prompt
source /usr/share/bash-completion/completions/git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n\[\e[0;1;38;5;202m\]\u\[\e[0m\]: \[\e[0;1;38;5;28m\]\w\[\e[0m\]$(parse_git_branch)\[\e[0m\]\n> "
