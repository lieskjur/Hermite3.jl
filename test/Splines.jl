using .Hermit3
using Plots
include(DoublePlot.jl)

Pk = [ [0,0], [2,0], [0,2], [0,0] ]
pk = [ zeros(2) for i in 1:4 ]
tk = [ 0, 2, 4, 6, ]

Hermit3.spline(Pk,pk,tk,1)
Hermit3.spline(Pk,pk,tk,1,0)
Hermit3.spline(Pk,pk,tk,1,0:2)

ts = 0:0.06:6
xs = mapreduce( t->Hermit3.spline(Pk,pk,tk,t,0), hcat, ts)
plt_curve = double_plot(ts,xs)