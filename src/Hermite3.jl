module Hermite3

Φ(t) = [ 1.0    0.0    0.0    0.0
         t      1.0    0.0    0.0
         t^2/2  t      1.0    0.0
         t^3/6  t^2/2  t      1.0   ]

M = [ 1.0   0.0  -6.0   12.0
      0.0   1.0  -4.0    6.0
      0.0   0.0   6.0  -12.0
      0.0   0.0  -2.0    6.0 ]

# Uniform curves
function curve(P0,Ṗ0,P1,Ṗ1,t)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ψ->C*M*ψ, eachcol(Φ(t)) )
end

function curve(P0,Ṗ0,P1,Ṗ1,t,d::Int)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	ψ = view(Φ(t),:,d+1)
	return C*M*ψ
end

function curve(P0,Ṗ0,P1,Ṗ1,t,d)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	Ψ = view(Φ(t),:,d.+1)
	return map( ψ->C*M*ψ, eachcol(Ψ) )
end

# Non-uniform curves
normalize(ts,tf,t) = (t-ts)/(tf-ts)

curve(Ps,Ṗs,Pf,Ṗf,ts,tf,t) = curve(Ps,Ṗs,Pf,Ṗf,normalize(ts,tf,t))
curve(Ps,Ṗs,Pf,Ṗf,ts,tf,t,d) = curve(Ps,Ṗs,Pf,Ṗf,normalize(ts,tf,t),d)

# Splines
function segments(Pk::Vector,Ṗk::Vector,tk::Vector,t::Real)
	@assert length(Pk) == length(Ṗk)
	for i in 2:length(tk)
		if tk[i] >= t
			t = normalize(tk[i-1],tk[i],t)
			Ps = Pk[i-1]
			Ṗs = Ṗk[i-1]
			Pf = Pk[i]
			Ṗf = Ṗk[i]
			return Ps,Ṗs,Pf,Ṗf,t
		end
	end
end

spline(Pk,Ṗk,tk,t) = curve(segments(Pk,Ṗk,tk,t)...)
spline(Pk,Ṗk,tk,t,d) = curve(segments(Pk,Ṗk,tk,t)...,d)

end