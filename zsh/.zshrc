HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
# rsync -azut --no-perms --no-owner --no-group --ignore-times --exclude 'NestorCode' --progress iweaver@emu.astro.puc.cl:/data/ACCESS/IMACS .
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
ZLE_REMOVE_SUFFIX_CHARS="" # keeps space from being eaten by pipe after tab

# Aliases
alias rse="rsync -avvPhz --ignore-existing iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ."
alias rse2="rsync -trluhvv --delete --stats --inplace iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ~/ACCESS/"
alias ..="cd .."
alias acc="cd ~/cfa/mercedes/ACCESS"
alias anc="open -a /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app"
alias bk="cp -r ~/.config/xfce4 ~/config/"
alias bkmint="dconf dump / > ~/configs/mint_backup"
alias ca="conda activate"
alias cee="conda env export --from-history"
alias cel="conda env list"
alias cf="ssh -tX iweaver@mars.cfa.harvard.edu bash"
alias emu='ssh iweaver@emu.astro.puc.cl'
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gl="git log --graph --abbrev-commit"
alias gp="git pull"
alias gpu="git push -u origin"
alias gr="git remote -v"
alias gs="git status"
alias gu="git commit -am 'up'; git push"
alias hyd="ssh -tX iweaver@hydra-login01.si.edu bash -l"
alias j="julia --project=@."
alias j1="~/julia-1.0.5/bin/julia"
alias j5="~/julia-1.5.4/bin/julia"
alias j7="~/julia-d6b5bf962a/bin/julia"
alias jp="julia --project=."
alias jpy="jupyter-notebook"
alias jtd="jt -t oceans16 -fs 12 -ofs 12 -nfs 12 -cellw 100%"
alias jtr="jt -r"
alias jtr="jt -r"
alias l='ls -CF'
alias la='ls -A'
alias ld='cp -r ~/config/xfce4 ~/.config/'
alias ldmint='dconf load / < ~/configs/mint_backup'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias n="nvim"
alias niv="nvim ~/.config/nvim/init.vim"
alias ni="nvim ~/.config/nvim/init.lua"
alias nr="nvim -R"
alias nt="nvim --listen /tmp/nvimsocket"
alias o2='cd $CFA/mercedes/O2'
alias o="xdg-open"
alias pd="conda deactivate"
alias pl='julia --project=@. -e "using Pluto;
    notebook = length(ARGS) == 1 ? ARGS[1] : nothing;
    Pluto.run(notebook=notebook)"'
alias pr='cd ~/Projects'
alias r="ranger"
alias rcl="rclone mount --daemon"
alias rm="rm -i"
alias src="source ~/.zshrc"
alias untar="tar -xvf"
alias wp="which python"
alias xclip="xclip -selection c"
alias zi="nvim ~/.zshrc"
alias rtr="rclone delete trash: --drive-trashed-only --drive-use-trash=false --verbose=2 --fast-list"

export H="iweaver@hydra-login01.si.edu"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

cec ()
{
    conda env create -f "$1"; conda activate "$2"
}
ceu ()
{
    conda env update --file "$1" --prune
}
cce ()
{
    conda create --name "$1" python="$2"; conda activate "$1"
}
cre ()
{
    conda remove --name "$1" --all
}

# Useful functions
rd () { rsync -az --progress iweaver@hydra-login01.si.edu:"$1" "$2"; }
ru () { rsync -az --progress "$1" iweaver@hydra-login01.si.edu:"$2"; }
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# Julia bin PATH
export PATH="$PATH:$HOME/julia-1.6.3/bin"
export PATH="$PATH:$HOME/.julia/bin"
# Julia autocompletion PATH
export FPATH="$HOME/.julia/completions:$FPATH"
export fpath=(~/.zsh/functions $fpath)

# TexLive
export MANPATH="/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH"
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"

# vimtex
export PATH="$HOME/.local/bin:$PATH"

# Pandexo
export pandeia_refdata="$HOME/data/pandexo/pandeia_data-1.5rc2"
export PYSYN_CDBS="$HOME/data/pandexo/synphot5/grp/hst/cdbs"

fpath+=~/.zfunc

export PATH="$HOME/.poetry/bin:$PATH"

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

autoload -Uz compinit
compinit

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST
PROMPT='
($CONDA_DEFAULT_ENV) %B%F{208}%n%f%b:%F{40}%~%f%F{220} (${vcs_info_msg_0_}) %f
> '
