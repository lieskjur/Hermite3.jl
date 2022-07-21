module Hermite3

# Uniform curves

Φ(t) = [ 1.0    0.0    0.0    0.0
         t      1.0    0.0    0.0
         t^2/2  t      1.0    0.0
         t^3/6  t^2/2  t      1.0 ]

# M = inv( hcat( Φ(0)[:,1:2], Φ(1)[:,1:2] ))
         
M = [ 1.0   0.0  -6.0   12.0
      0.0   1.0  -4.0    6.0
      0.0   0.0   6.0  -12.0
      0.0   0.0  -2.0    6.0 ]

function curve(P0,Ṗ0,P1,Ṗ1,t)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ϕ->C*M*ϕ, eachcol(Φ(t)) )
end

function curve(P0,Ṗ0,P1,Ṗ1,t,d::Int)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return C*M*view(Φ(t),:,d+1)
end

function curve(P0,Ṗ0,P1,Ṗ1,t,d)
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ϕ->C*M*ϕ, eachcol(view(Φ(t),:,d.+1)) )
end

# Non-uniform curves

Ψ(Δt,τ) = [ 1.0           0.0           0.0     0.0
            τ/Δt          1/Δt          0.0     0.0
            τ^2/(2*Δt^2)  τ/Δt^2        1/Δt^2  0.0
            τ^3/(6*Δt^3)  τ^2/(2*Δt^3)  τ/Δt^3  1/Δt^3 ]

D(Δt) = [ 1. 0. 0. 0.
          0. Δt 0. 0.
          0. 0. 1. 0.  
          0. 0. 0. Δt ]

function curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t)
	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ψ->C*D(Δt)*M*ψ, eachcol(Ψ(Δt,τ)) )
end

function curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t,d::Int)
	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return ψ->C*D(Δt)*M*view(Ψ(Δt,τ),:,d.+1)
end

function curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t,d)
	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ψ->C*D(Δt)*M*ψ, eachcol(view(Ψ(Δt,τ),:,d.+1)) )
end

# Splines

function segments(Pk::Vector,Ṗk::Vector,tk::Vector,t::Real)
	@assert length(Pk) == length(Ṗk)
	for i in 2:length(tk)
		if tk[i] >= t
			P0 = Pk[i-1]
			Ṗ0 = Ṗk[i-1]
			P1 = Pk[i]
			Ṗ1 = Ṗk[i]
			t0 = tk[i-1]
			t1 = tk[i]
			return P0,Ṗ0,P1,Ṗ1,t0,t1,t
		end
	end
end

spline(Pk,Ṗk,tk,t) = curve(segments(Pk,Ṗk,tk,t)...)
spline(Pk,Ṗk,tk,t,d) = curve(segments(Pk,Ṗk,tk,t)...,d)

end