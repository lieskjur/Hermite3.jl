using Hermite3
using Plots

P0 = [0,0]
P1 = [1,0]
Ṗ0 = [1,2]
Ṗ1 = [1,2]

t0 = 0; tf = 4; t = 2
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,tf,t)
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,tf,t,0)
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,tf,t,0:2)

ts = 0:0.04:4
xs = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,tf,t,0), hcat, ts)

plt = plot(xlabel="t")
for (i,s) in enumerate(["x","y"])
	plot!(plt,ts,xs[i,:],ylabel=s,color=0+i)
end
display(plt)