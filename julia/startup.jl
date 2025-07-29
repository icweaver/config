if isinteractive()
    using OhMyREPL
    darkmode = occursin("dark", read(`gsettings get org.gnome.desktop.interface gtk-theme`, String))
    if darkmode
        colorscheme!("GitHubDark")
    else
        colorscheme!("GitHubLight")
    end
end
