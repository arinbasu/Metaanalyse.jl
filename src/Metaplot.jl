"""
    metaplot(y,v,x) 
    
    Metaregression of point estimate on ONE variable (x) 
    
    
"""

using DataFrames, CairoMakie, GLM, HypothesisTests, Distributions
CairoMakie.activate!

# function for the metaplot
function metaplot(y,v,x)
    w = 1 ./ v

    fig,ax,plt = scatter(x,y, markersize = Point2f.(w) )
    
    df = DataFrame("i" => y, "j" => x)
    pred = predict(lm(@formula(i~j), df) )
    lines!(ax, x,pred)
    ax.title = "Meta regression plot"
    ax.xlabel = "Variable" 
    ax.ylabel = "Effect Size"
    ax.xgridvisible = false
    ax.ygridvisible = false
    return(fig)

end