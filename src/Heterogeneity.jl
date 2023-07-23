using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

"""
    isq(study,y,v)

    Heterogeneity statistics for the meta analysis. 
        
    Inputs study, an array of point estimates (y)  and an array of variances around the point estimates (v).

"""

function isq(study,y,v)
    w = 1 ./ v
    q = sum(w .* y .^2) - ( (sum(w .* y))^2 / sum(w) )
    df = length(study) - 1
    isq = max( ((q - df) / q ) * 100, 0)
    
    if isq < 25
        isq_val = "low"
    elseif (isq > 25 && isq < 50)
        isq_val = "moderate"
    else 
        isq_val = "high"
    end
    
    c_val = sum(w) - ((sum(w .^ 2)) / sum(w))
    tausq = (q - df) / c_val
    p = ccdf(Chisq(df), q)
    if p < 0.001
        p = 0.001
    else
        p = p
    end
    
    return(isq, isq_val, q, tausq, p)
    end