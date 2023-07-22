using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

# Now write the random effects model function

function randEffects(y,v)
    t = tausq(y,v)
    v1 = v .+ t
    w1 =  1 ./ v1 
    m = sum(w1 .* y) / sum(w1)
    vm = 1 / sum(w1)
    sem = sqrt(vm)
    llm = m - (1.96 * sem)
    ulm = m + (1.96 * sem)
    z = m/sem
    p = ccdf(Normal(), abs(z) )
    if p < 0.001
       p = 0.001
    else
        p = round(p, digits = 3)
    end
    return(m, vm, llm, ulm, p)
    
end