using Hermite3
using Plots

Pk = [ [0,0], [4,0], [0,3], [0,0] ]
Ṗk = [ zeros(2) for i in 1:4 ]
tk = [ 0, 2, 4, 6 ]

Hermite3.spline(Pk,Ṗk,tk,1)
Hermite3.spline(Pk,Ṗk,tk,1,0)
Hermite3.spline(Pk,Ṗk,tk,1,0:2)

ts = range(tk[1],tk[end],101)
xs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,0), hcat, ts)
ẋs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,1), hcat, ts)
ẍs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,2), hcat, ts)

plt = plot(xlabel="t")
for (i,s) in enumerate(["x","y"])
	plot!(plt,ts,xs[i,:],label=s,color=0+i)
	plot!(plt,ts,ẋs[i,:],label=s*"̇",color=2+i)
	plot!(plt,ts,ẍs[i,:],label=s*"̈",color=4+i)
end
display(plt)