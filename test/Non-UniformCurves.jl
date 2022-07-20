using .Hermit3
using Plots
include(DoublePlot.jl)

P = [0,0]
Q = [1,0]
Ṗ = [1,2]
Q̇ = [1,2]

t0 = 0; tf = 4; t = 2
Hermit3.curve(P,Ṗ,Q,Q̇,t0,tf,t)
Hermit3.curve(P,Ṗ,Q,Q̇,t0,tf,t,0)
Hermit3.curve(P,Ṗ,Q,Q̇,t0,tf,t,0:2)

ts = 0:0.04:4
xs = mapreduce( t->Hermit3.curve(P,Ṗ,Q,Q̇,t0,tf,t,0), hcat, ts)
plt_curve = double_plot(ts,xs)