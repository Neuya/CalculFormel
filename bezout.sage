def Bezout(l):
	d = l[0]
	U=[1]
	for i in range(1,len(l)):
		(d,u,v)=xgcd(d,l[i])
		U=[u*U[j] for j in range(0,i)] + [v]
	return (d,U)
