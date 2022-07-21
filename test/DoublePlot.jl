function double_plot(ts,xs)
	plt = plot(layout=grid(2,1,heights=[.5,.5]))
	plot!(plt,ts,xs[1,:],subplot=1)
	plot!(plt,ts,xs[2,:],subplot=1)
	plot!(plt,subplot=2,aspect_ratio=:equal)
	plot!(plt,xs[1,:],xs[2,:],subplot=2)
	return plt
end

function double_plot(ts,xs,ẋs)
	plt = plot(layout=grid(2,1,heights=[.5,.5]))
	plot!(plt,ts,xs[1,:],subplot=1,color=1)
	plot!(plt,ts,xs[2,:],subplot=1,color=2)
	plot!(plt,ts,ẋs[1,:],subplot=1,color=1,linestyle=:dash)
	plot!(plt,ts,ẋs[2,:],subplot=1,color=2,linestyle=:dash)
	plot!(plt,subplot=2,aspect_ratio=:equal)
	plot!(plt,xs[1,:],xs[2,:],subplot=2)
	return plt
end
function double_plot(ts,xs,ẋs,ẍs)
	plt = plot(layout=grid(2,1,heights=[.5,.5]))
	for i in 1:size(xs,1)
		plot!(plt,ts,xs[i,:],subplot=1,color=i)
		plot!(plt,ts,ẋs[i,:],subplot=1,color=i,linestyle=:dash)
		plot!(plt,ts,ẍs[i,:],subplot=1,color=i,linestyle=:dot)
	end
	plot!(plt,subplot=2,aspect_ratio=:equal)
	plot!(plt,xs[1,:],xs[2,:],subplot=2)
	return plt
end

function plot_derivates(ts,xs,ẋs,ẍs;symbols=["x","y","z"])
	plt = plot(xlabel="t")
	for i in 1:size(xs,1)
		plot!(plt,ts,xs[i,:],label=symbols[i])
		plot!(plt,ts,ẋs[i,:],label=symbols[i]*"̇")
		plot!(plt,ts,ẍs[i,:],label=symbols[i]*"̈")
	end
	return plt
end
