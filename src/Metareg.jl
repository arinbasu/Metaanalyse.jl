"""
    metareg(y,x) 
    
    Regression of y array or array of point estimates on only one x variable  presented in the form of an array. 


"""
using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

## meta regression of the log risk ratio

function metareg(y,x)
    df = DataFrame("y" => y, "x" => x)
    reg = lm(@formula(y~x), df)
    return(reg)
end