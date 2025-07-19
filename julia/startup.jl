if isinteractive()
    using OhMyREPL
    darkmode = occursin("dark", read(`gsettings get org.gnome.desktop.interface gtk-theme`, String))
    if darkmode
        @info "Setting dark theme"
        colorscheme!("GitHubDark")
    else
        @info "Setting light theme"
        colorscheme!("GitHubLight")
    end
end
