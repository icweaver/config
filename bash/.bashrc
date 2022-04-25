HISTCONTROL=ignoredups:erasedups  # no duplicate entries
HISTSIZE=-1                       # big big history
HISTFILESIZE=-1                   # big big history
shopt -s histappend               # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# rsync -azut --no-perms --no-owner --no-group --ignore-times --exclude 'NestorCode' --progress iweaver@emu.astro.puc.cl:/data/ACCESS/IMACS .

# Aliases
alias rse="rsync -avvPhz --ignore-existing iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ."
alias rse2="rsync -trluhvv --delete --stats --inplace iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ~/ACCESS/"
alias ..="cd .."
alias acc="cd ~/cfa/mercedes/ACCESS"
alias anc="open -a /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app"
alias bkmanjaro="cp -r ~/.config/xfce4 ~/config/"
alias bk="dconf dump / > ~/Projects/config/mint_backup"
alias cf="ssh -tX iweaver@mars.cfa.harvard.edu bash"
alias emu="ssh iweaver@emu.astro.puc.cl"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gl="git log --graph --abbrev-commit"
alias gp="git pull"
alias gpu="git push -u origin"
alias gr="git remote -v"
alias gs="git status"
alias gu="git commit -am 'up'; git push"
alias hyd="ssh -t iweaver@hydra-login01.si.edu 'bash'"
alias j="julia --project=@."
alias j5="~/julia-1.5.4/bin/julia --project=@."
alias j6="~/julia-1.6.5/bin/julia --project=@."
alias jpy="jupyter-notebook"
alias jtd="jt -t oceans16 -fs 12 -ofs 12 -nfs 12 -cellw 100%"
alias jtr="jt -r"
alias jtr="jt -r"
alias l="ls -CF"
alias la="ls -A"
alias ldmint="cp -r ~/Projects/config/xfce4 ~/.config/"
alias ld="dconf load / < ~/Projects/config/mint_backup"
alias ll="ls -alF"
alias ls="ls --color=auto"
alias mm="micromamba"
alias n="nvim"
alias ni="nvim ~/.config/nvim/init.lua"
alias nr="nvim -R"
alias nt="nvim --listen /tmp/nvim.sock"
alias o2="cd $CFA/mercedes/O2"
alias o="xdg-open"
alias pa="micromamba activate gen"
alias pd="micromamba deactivate"
alias pl='julia --project=@. -e "using Pluto;
    notebook = length(ARGS) == 1 ? ARGS[1] : nothing;
    Pluto.run(notebook=notebook)"'
alias pl6='~/julia-1.6.5/bin/julia --project=@. -e "using Pluto;
    notebook = length(ARGS) == 1 ? ARGS[1] : nothing;
    Pluto.run(notebook=notebook)"'
alias pr="cd ~/Projects"
alias r="ranger"
alias rcl="rclone mount --daemon"
alias rm="rm -i"
alias src="source ~/.bashrc"
alias untar="tar -xvf"
alias wp="which python"
alias xclip="xclip -selection c"
alias bsh="nvim ~/.bashrc"
alias rtr="rclone delete trash: --drive-trashed-only --drive-use-trash=false --verbose=2 --fast-list"

export H="iweaver@hydra-login01.si.edu"

# micromamba/conda commands
mec ()
{
    micromamba create -f "$1"; micromamba activate "$2"
}
meu ()
{
    micromamba env update --file "$1" --prune
}
mce ()
{
    micromamba create --name "$1" python="$2" -c conda-forge; micromamba activate "$1"
}
mre ()
{
    micromamba remove --name "$1" --all
}

# Useful functions
rd () { rsync -az --progress iweaver@hydra-login01.si.edu:"$1" "$2"; }
ru () { rsync -az --progress "$1" iweaver@hydra-login01.si.edu:"$2"; }
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# For paq
#XDG_DATA_HOME="$HOME/.local/share"

# Neovim v0.7 (manjaro)
export PATH="$HOME/.local/bin/nvim-linux64/bin:$PATH"

# Julia bin PATH
export PATH="$PATH:/home/mango/julia-1.7.2/bin"
# Julia autocompletion PATH
export FPATH="$HOME/.julia/completions:$FPATH"

# Poetry
export PATH="/home/mango/.local/bin:$PATH"

# Latex
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"

# GTK
# https://juliagraphics.github.io/Gtk.jl/latest/#Installation-1
export GTK_PATH=$GTK_PATH:/usr/lib/x86_64-linux-gnu/gtk-3.0

# Prompt
source /usr/share/bash-completion/completions/git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n\[\e[0;1;38;5;208m\]\u\[\e[0m\]: \[\e[0;1;38;5;40m\]\w\[\e[0m\]\[\e[0;1;38;5;220m\]\$(parse_git_branch)\[\e[0m\]\n> "
PS1=$PS1'\[\e]2;\W\a\]' # set terminal title to cwd

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/mango/Desktop/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/mango/micromamba";
__mamba_setup="$('/home/mango/Desktop/bin/micromamba' shell hook --shell bash --prefix '/home/mango/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/mango/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/mango/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/mango/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
