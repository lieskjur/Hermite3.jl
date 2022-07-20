function double_plot(ts,xs)
	plt = plot(layout=grid(2,1,heights=[.5,.5]))
	plot!(plt,ts,xs[1,:],subplot=1)
	plot!(plt,ts,xs[2,:],subplot=1)
	plot!(plt,subplot=2,aspect_ratio=:equal)
	plot!(plt,xs[1,:],xs[2,:],subplot=2)
	return plt
end