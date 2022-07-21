T = [ 0, 1., 3., 7., 9. ]
ts = range(T[1],T[end],101)

using PolynomialPaths
X = [ [0,0], [0,0], [pi/4,0], [-pi/4,0], [0,0] ]
path = consequent_polynomial_paths(X,T)
sdp,ṡdp,s̈dp = [ d for d in eachrow(mapreduce(t -> path(t), hcat, ts)) ]

using Hermite3
Pk = [ [0], [0], [pi/4], [-pi/4], [0] ]
Ṗk = [ [0], [0], [0],     [0],    [0] ]
sdh = mapreduce( t->Hermite3.spline(Pk,Ṗk,T,t,0), vcat, ts)
ṡdh = mapreduce( t->Hermite3.spline(Pk,Ṗk,T,t,1), vcat, ts)
s̈dh = mapreduce( t->Hermite3.spline(Pk,Ṗk,T,t,2), vcat, ts)

isapprox(sdp,sdh)
isapprox(ṡdp,ṡdh)
isapprox(s̈dp,s̈dh)