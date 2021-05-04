def sumtest():
	k=var('k')
	n=var('n')
	print("Valeur de sommes des carrés d'entier de 0 à n:")
	print(factor(sum(k^2,k,0,n)))


def listtest():
	L=[1,2,3,4,5,6]
	print(L)
	print("L[0]=",L[0])
	print("L de 2 à 4 ",L[1:4])


def pair(n):
	v=[]
	for i in range(3,n):
		if i%2 == 0:
			v.append(i)
	return v


def triplet_pyth50V1():
	liste=[]
	for x in range(1,51):
		for y in range(1,51):
			for z in range(1,51):
				if(x!=y and y!=z and x!=z):
					if x^2+y^2 == z^2:
						liste.append([x,y,z])
	return liste

def tripletPythV2(n):
	liste=[]
	for x in [1..n]:
		for y in [1..n]:
			zq = x^2+y^2
			if zq<=n^2 and zq.is_square():
				liste.append([x,y,sqrt(zq)])

	return liste


def partiesEns(n):
	l = []
	for i in [1..n]:
		for y in [i+1..n]:
			l.append([i,y])
	return l

def partiesEnsP1(n,k,L):
	lret = []
	for o in L:
		for i in range(o[k-1]+1,n+1):
			o2 = o[:]
			o2.append(i)
			lret.append(o2)
	return lret

def partieEnsk(n,k):
	l = partiesEns(n)
	for i in range(2,k):
		l = partiesEnsP1(n,i,l)
	return l


def nettoie(L):
	if(L[len(L)-1]==0):
		L.pop(len(L)-1)
	return L

def Plus(P,Q):
	if(len(P)>=len(Q)):
		M = P
		Mi = Q
	else:
		M = Q
		Mi = P
	L = []
	for i in range(0,len(Mi)):
		L.append(M[i] + Mi[i])
	for j in range(len(Mi),len(M)):
		L.append(M[j])	

	return L

def Decale(P,i):
	L = P[:]
	Pint = P[:]
	for k in range(0,len(P)):
		if (k+i)<len(P):
			L[k+i] = Pint[k]
		else:
			L.append(Pint[k])
		if(k-i<0):
			L[k] = 0
		else:
			L[k] = Pint[k-i]
	return L

def Decale2(P,i):
	L = P[:]
	for k in range(0,i):
		L.insert(k,0)
	return L

def FoisScalaire(P,a):
	L = P[:]
	for i in range(0,len(L)):
		L[i]=L[i]*a
	return L

def Fois(P,Q):
	R=[0]
	for c in P :
		R=Plus(R,FoisScalaire(Q,c))
		Q=Decale(Q,1)
	return nettoie(R)















