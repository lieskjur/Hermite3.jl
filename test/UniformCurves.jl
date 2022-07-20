using Hermite3
using Plots
include("DoublePlot.jl")
P = [0,0]
Q = [1,0]
Ṗ = [1,2]
Q̇ = [1,2]

t = .5
Hermit3.curve(P,Ṗ,Q,Q̇,t)
Hermit3.curve(P,Ṗ,Q,Q̇,t,0)
Hermit3.curve(P,Ṗ,Q,Q̇,t,0:2)

ts = 0:0.01:1
xs = mapreduce( t->Hermit3.curve(P,Ṗ,Q,Q̇,t,0), hcat, ts)
plt = double_plot(ts,xs)
display(plt)