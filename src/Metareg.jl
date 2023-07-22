using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

## meta regression of the log risk ratio

function metareg(y,x)
    df = DataFrame("y" => y, "x" => x)
    reg = lm(@formula(y~x), df)
    return(reg)
end