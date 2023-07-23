"""
    tausq(y,v) 
    
    Tau square estimate, where y refers to the array containing the point estimates of the studies included in the meta analysis 
    and v refers to the array containing the variance estimates around the point estimates of the individual studies. 


"""

using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!
# Write a function for tausq
function tausq(y,v)
    w = 1 ./ v
    q = sum(w .* y.^2) - ( (sum(w .* y))^2 / sum(w) )
    df = length(y) - 1
    c_stat = sum(w) - (sum(w.^2)/sum(w))
    tausq = (q - df) / c_stat
    return(tausq)
end