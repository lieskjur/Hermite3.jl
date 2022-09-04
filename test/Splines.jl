using Hermite3
using Plots

Pk = [ [0.,0], [4.,0], [0.,3], [0.,0] ]
Ṗk = [ zeros(2) for i in 1:4 ]
tk = [ 0., 2., 4., 6. ]

Hermite3.spline(Pk,Ṗk,tk,1.)
Hermite3.spline(Pk,Ṗk,tk,1.,0)
Hermite3.spline(Pk,Ṗk,tk,1.,0:2)

ts = range(tk[1],tk[end],1001)
xs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,0), hcat, ts)
ẋs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,1), hcat, ts)
ẍs = mapreduce( t->Hermite3.spline(Pk,Ṗk,tk,t,2), hcat, ts)

plt_xy = plot(xlabel="x(t)",ylabel="y(t)",legend=:none)
plot!(plt_xy,xs[1,:],xs[2,:],aspect_ratio=:equal)
display(plt_xy)

plt_tP = plot(xlabel="t")
for (i,s) in enumerate(["x","y"])
	plot!(plt_tP,ts,xs[i,:],label=s*"(t)",color=0+i)
	plot!(plt_tP,ts,ẋs[i,:],label=s*"̇(t)",color=2+i)
	plot!(plt_tP,ts,ẍs[i,:],label=s*"̈(t)",color=4+i)
end
display(plt_tP)

