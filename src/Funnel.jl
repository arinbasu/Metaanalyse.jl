using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

"""
    funnel(y,v)

    Funnel Plot.

"""
function funnel(y,v)
    se = sqrt.(v)
    w = 1 ./ v
    m = sum(w .* y) / sum(w)
    vm = 1 / sum(w)
    sem = sqrt(vm)
    llm = m - (1.96 * sem)
    ulm = m + (1.96 * sem)
    fig,ax,plt = scatter(y,se)
    lines!([m, minimum(y)], [0, maximum(se)], color = :black)
    lines!([m, maximum(y)], [0, maximum(se)], color = :black)
    ax.yreversed = true
    ax.title = "Funnel Plot"
    ax.xlabel = "Point Estimates"
    ax.ylabel = "Standard Error of the studies"
    return(fig)
end