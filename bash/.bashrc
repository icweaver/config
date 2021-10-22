HISTSIZE=-1
HISTFILESIZE=-1

# rsync -azut --no-perms --no-owner --no-group --ignore-times --exclude 'NestorCode' --progress iweaver@emu.astro.puc.cl:/data/ACCESS/IMACS .

# Aliases
alias rse="rsync -avvPhz --ignore-existing iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ."
alias rse2="rsync -trluhvv --delete --stats --inplace iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ~/ACCESS/"
alias ..="cd .."
alias acc="cd ~/cfa/mercedes/ACCESS"
alias anc="open -a /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app"
alias bkmanjaro="cp -r ~/.config/xfce4 ~/config/"
alias bk="dconf dump / > ~/config/mint_backup"
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
alias ldmint='cp -r ~/config/xfce4 ~/.config/'
alias ld='dconf load / < ~/config/mint_backup'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias n="nvim"
alias ni="nvim ~/.config/nvim/init.vim"
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
alias src="source ~/.bashrc"
alias untar="tar -xvf"
alias wp="which python"
alias xclip="xclip -selection c"
alias zi="nvim ~/.bashrc"
alias rtr="rclone delete trash: --drive-trashed-only --drive-use-trash=false --verbose=2 --fast-list"

export H="iweaver@hydra-login01.si.edu"

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

# Poetry
export PATH="/home/mango/.local/bin:$PATH"

#setopt PROMPT_SUBST
#PROMPT='
#($CONDA_DEFAULT_ENV) %B%F{208}%n%f%b:%F{40}%~%f%F{220} (${vcs_info_msg_0_}) %f
#> '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mango/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mango/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mango/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mango/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /usr/share/bash-completion/completions/git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n(\$CONDA_DEFAULT_ENV) \[\e[0;1;38;5;208m\]\u\[\e[0m\]: \[\e[0;1;38;5;40m\]\w\[\e[0m\]\[\e[0;1;38;5;220m\]\$(parse_git_branch)\[\e[0m\]\n> "
PS1=$PS1'\[\e]2;\W\a\]' # set terminal title to cwd
