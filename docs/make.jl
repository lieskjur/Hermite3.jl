using Documenter, Hermite3
makedocs(
    sitename="Hermite3",
    pages=[
        "Home" => "index.md",
        "Theory" => [
            "Uniform Curves" => "Uniform Curves.md",
            "Non-Uniform Curves" => "Non-Uniform Curves.md",
            "Splines" => "Splines.md",
            ]
        ]
    )