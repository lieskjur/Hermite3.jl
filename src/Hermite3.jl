module Hermite3

Φ(t) = [ 1.0    0.0    0.0    0.0
         t      1.0    0.0    0.0
         t^2/2  t      1.0    0.0
         t^3/6  t^2/2  t      1.0   ]

M = [ 1.0  -0.0  -6.0   12.0
      0.0   1.0  -4.0    6.0
      0.0   0.0   6.0  -12.0
      0.0   0.0  -2.0    6.0 ]

function curve(P,p,Q,q,t)
	A = hcat(P,p,Q,q)
	return map( ψ->A*M*ψ, eachcol(Φ(t)) )
end

function curve(P,p,Q,q,t,d::Int)
	A = hcat(P,p,Q,q)
	ψ = view(Φ(t),:,d+1)
	return A*M*ψ
end

function curve(P,p,Q,q,t,d)
	A = hcat(P,p,Q,q)
	Ψ = view(Φ(t),:,d.+1)
	return map( ψ->A*M*ψ, eachcol(Ψ) )
end

normalize(t0,tf,t) = (t-t0)/(tf-t0)

curve(P,p,Q,q,t0,tf,t) = curve(P,p,Q,q,normalize(t0,tf,t))
curve(P,p,Q,q,t0,tf,t,d) = curve(P,p,Q,q,normalize(t0,tf,t),d)

function segments(Pk::Vector,pk::Vector,tk::Vector,t::Vector)
	@assert length(Pk) == length(pk)
	for i in 2:length(tk)
		if tk[i] >= t
			t = normalize(tk[i-1],tk[i],t)
			P0 = Pk[i-1]
			p0 = pk[i-1]
			Pf = Pk[i]
			pf = pk[i]
			return P0,p0,Pf,pf,t
		end
	end
end

spline(Pk,pk,tk,t) = curve(segments(Pk,pk,tk,t)...)
spline(Pk,pk,tk,t,d) = curve(segments(Pk,pk,tk,t)...,d)

end