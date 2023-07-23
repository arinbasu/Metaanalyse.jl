
"""
    gIndGrps(m1,m2,s1,s2,n1,n2)
    
    Hedge's g for independent groups.
    
    Calculate d and g with indepenent groups, needs the following inputs, m1 = mean of first group,
    m2 = mean of second group, s1 = standard deviation of the first group, s2 = standard deviation of the second group, 
    n1 = number of participants in the first group, n2 = number of participants in the second group, returns Hedge's g

"""
function gIndGrps(m1, m2, s1, s2, n1, n2)
    s_within = sqrt(((n1-1) * s1^2 + (n2-1) * s2^2) / (n1+n2-2) )
    d = (m1 - m2) / s_within
    df = n1+n2 - 2
    j = 1 - (3/(df*4 - 1))
    g = j * d 
    return(g)
end