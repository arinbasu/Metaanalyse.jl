"""
    vgIndGrps(m1,m2,s1,s2,n1,n2) 
    
    Variance estimates around the Hedge's g
    
    Where m1 = mean of the first group, m2 = mean of the second group,
    s1=standard deviation of the first group, s2=standard deviation of the second group,
    n1=number of participants in the first group, n2=number of participants in the second group.
    Produces one element, vg=variance around Hedge's g
    
"""

using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

function vgIndGrps(m1, m2, s1, s2, n1, n2)
    s_within = sqrt(((n1-1)* s1^2 + (n2-1)* s2^2)/ (n1+n2-2) )
    d = (m1-m2)/s_within
    vd = (n1+n2)/(n1*n2) + d^2/((n1+n2)*2)
    df = n1+n2-2
    j = 1 - (3/(df*4 - 1))
    vg = j^2 * vd 
    return(vg)
end