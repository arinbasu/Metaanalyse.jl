push!(LOAD_PATH,"../src/")
using Metaanalyse
using Documenter
makedocs(
         sitename = "Metaanalyse.jl",
         modules  = [Metaanalyse],
         pages=[
                "Home" => "index.md"
               ])
deploydocs(;
    repo="github.com/arinbasu/Metaanalyse.jl",
)