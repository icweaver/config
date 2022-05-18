import REPL
import Pkg

ENV[JULIA_EDITOR] = "nvim"

isfile("Project.toml") && Pkg.activate(Base.current_project())

Base.atreplinit() do repl
    repl.interface = REPL.setup_interface(repl)
    repl.interface.modes[1].prompt =
        () -> string(Pkg.REPLMode.promptf()[1:end-5], "julia> ")
end
