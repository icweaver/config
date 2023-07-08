# Aliases
alias rse="rsync -avvPhz --ignore-existing iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ."
alias rse2="rsync -trluhvv --delete --stats --inplace iweaver@emu.astro.puc.cl:/data/ACCESS/./IMACS ~/ACCESS/"
alias ..="cd .."
alias acc="cd ~/cfa/mercedes/ACCESS"
alias anc="open -a /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app"
alias bkx="cp -r ~/.config/xfce4 ~/Projects/config/"
alias bkmint="dconf dump / > ~/Projects/config/mint_backup"
alias cf="ssh -tX iweaver@mars.cfa.harvard.edu bash"
alias cr="cargo run"
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
alias jpy="jupyter-notebook"
alias jtd="jt -t oceans16 -fs 12 -ofs 12 -nfs 12 -cellw 100%"
alias jtr="jt -r"
alias jtr="jt -r"
alias l="ls -CF"
alias la="ls -A"
alias ldx="cp -r ~/Projects/config/xfce4 ~/.config/"
alias ldmint="dconf load / < ~/Projects/config/mint_backup"
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
    Pluto.run(; notebook=notebook, auto_reload_from_file=true)"'
alias plm='julia --project=$HOME/Projects/pluto -e "using Pluto;
    notebook = length(ARGS) == 1 ? ARGS[1] : nothing;
    Pluto.run(; notebook=notebook)"'
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

# Neovim v0.7 (manjaro)
export PATH="$HOME/.local/bin/nvim-linux64/bin:$PATH"
export VISUAL=$(which nvim)
export EDITOR=$(which nvim)

# Useful functions
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
mec ()
{
    micromamba env create -f "$1"; micromamba activate "$2"
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

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/mango/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/mango/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
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

# Prompt
source /usr/share/bash-completion/completions/git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n\[\e[0;1;38;5;208m\]\u\[\e[0m\]: \[\e[0;1;38;5;40m\]\w\[\e[0m\]\[\e[0;1;38;5;220m\]\$(parse_git_branch)\[\e[0m\]\n> "

# Terminal title
PS1=$PS1'\[\e]0;\w\a\]'
