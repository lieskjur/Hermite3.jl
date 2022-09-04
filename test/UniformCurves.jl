using Hermite3
using Plots

P0 = [0,0]
P1 = [1,0]
Ṗ0 = [1,2]
Ṗ1 = [1,2]

t = .5
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t)
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,0)
Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,0:2)

ts = 0:0.01:1
xs = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,0), hcat, ts)
ẋs = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,1), hcat, ts)
ẍs = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,2), hcat, ts)

plt = plot(xlabel="t")
for (i,s) in enumerate(["x","y"])
	plot!(plt,ts,xs[i,:],label=s,color=0+i)
	plot!(plt,ts,ẋs[i,:],label=s*"̇",color=2+i)
	# plot!(plt,ts,ẍs[i,:],label=s*"̈",color=4+i)
end
display(plt)