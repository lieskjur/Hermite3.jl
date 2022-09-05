import Pkg
Pkg.add("Documenter")
include("make.jl")
deploydocs(
    repo = "github.com/lieskjur/Hermite3.jl.git",
    target = "build",
    branch = "gh-pages"
    # versions = ["stable" => "v^", "v#.#" ],
)