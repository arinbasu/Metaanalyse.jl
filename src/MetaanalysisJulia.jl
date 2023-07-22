module MetaanalysisJulia

# load the packages
using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

# -- beginning of export and include block
# Write the exports

export gIndGrps
export vgIndGrps
export fixedEffects
export tausq
export randEffects
export forestPlot
export isq
export metareg
export metaplot
export funnel

# Write the includes
include("FixedEffects.jl")
include("ForestPlot.jl")
include("Funnel.jl")
include("GIndGrps.jl")
include("Heterogeneity.jl")
include("Metaplot.jl")
include("Metareg.jl")
include("RandEffects.jl")
include("Tausq.jl")
include("VgIndGrps.jl")

## -- end of include and export block




end
