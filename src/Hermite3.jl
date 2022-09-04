module Hermite3

M = [ 1.0   0.0  -6.0   12.0
      0.0   1.0  -4.0    6.0
      0.0   0.0   6.0  -12.0
      0.0   0.0  -2.0    6.0 ]

# Uniform curves

ϕ(t) = [ 1.0, t,   t^2/2, t^3/6 ]
ϕ̇(t) = [ 0.0, 1.0, t,     t^2/2 ]
ϕ̈(t) = [ 0.0, 0.0, 1.0,   t     ]
ϕ⃛(t) = [ 0.0, 0.0, 0.0,   1.0   ]

Φ = [ ϕ, ϕ̇, ϕ̈, ϕ⃛ ]

function curve(P0::P, Ṗ0::P, P1::P, Ṗ1::P, t::Real) where P<:Vector
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ϕ->C*M*ϕ(t), Φ )
end

function curve(P0::P, Ṗ0::P, P1::P, Ṗ1::P, t::Real, d::Int) where P<:Vector
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return C*M*Φ[d+1](t)
end

function curve(P0::P, Ṗ0::P, P1::P, Ṗ1::P, t::Real, d::UnitRange{Int}) where P<:Vector
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ϕ->C*M*ϕ(t), Φ[d.+1] )
end

# Non-uniform curves

ψ(Δt,τ) = [ 1.0, τ/Δt, τ^2/(2*Δt^2), τ^3/(6*Δt^3) ]
ψ̇(Δt,τ) = [ 0.0, 1/Δt, τ/Δt^2,       τ^2/(2*Δt^3) ]  
ψ̈(Δt,τ) = [ 0.0, 0.0,  1/Δt^2,       τ/Δt^3       ]
ψ⃛(Δt,τ) = [ 0.0, 0.0,  0.0,          1/Δt^3       ]

Ψ = [ ψ, ψ̇, ψ̈, ψ⃛ ]

D(Δt) = [ 1. 0. 0. 0.
          0. Δt 0. 0.
          0. 0. 1. 0.  
          0. 0. 0. Δt ]

function curve(
    P0::P, Ṗ0::P, P1::P, Ṗ1::P,
    t0::T, t1::T, t::T
    ) where {P<:Vector,T<:Real}

	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ψ->C*D(Δt)*M*ψ(Δt,τ), Ψ )
end

function curve(
    P0::P, Ṗ0::P, P1::P, Ṗ1::P,
    t0::T, t1::T, t::T,
    d::Int
    ) where {P<:Vector,T<:Real}

	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return C*D(Δt)*M*Ψ[d+1](Δt,τ)
end

function curve(
    P0::P, Ṗ0::P, P1::P, Ṗ1::P,
    t0::T, t1::T, t::T,
    d::UnitRange{Int}
    ) where {P<:Vector,T<:Real}

	Δt = t1-t0; τ = t-t0
	C = hcat(P0,Ṗ0,P1,Ṗ1)
	return map( ψ->C*D(Δt)*M*ψ(Δt,τ), Ψ[d.+1] )
end

# Splines

function segments(
    Pk::Q, Ṗk::Q,
    tk::Vector{T}, t::T
    ) where {T,R,Q<:Vector{Vector{R}}}

	@assert length(Pk) == length(Ṗk)
	for i in 2:length(tk)
		if tk[i] >= t
			return Pk[i-1], Ṗk[i-1], Pk[i], Ṗk[i], tk[i-1], tk[i], t
		end
	end
end

spline(Pk,Ṗk,tk,t) = curve(segments(Pk,Ṗk,tk,t)...)
spline(Pk,Ṗk,tk,t,d) = curve(segments(Pk,Ṗk,tk,t)...,d)

end