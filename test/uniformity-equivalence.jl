using Hermite3

P0 = [0,0]
P1 = [1,0]
Ṗ0 = [1,2]
Ṗ1 = [1,2]

n = 101

tu = range(0,1,n)
xu = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,0), hcat, tu)
ẋu = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,1), hcat, tu)
ẍu = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t,2), hcat, tu)

t0 = 2; t1 = t0+1
tn = range(t0,t1,n)
xn = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t,0), hcat, tn)
ẋn = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t,1), hcat, tn)
ẍn = mapreduce( t->Hermite3.curve(P0,Ṗ0,P1,Ṗ1,t0,t1,t,2), hcat, tn)

@assert isapprox(xn,xu)
@assert isapprox(ẋn,ẋu)
@assert isapprox(ẍn,ẍu)