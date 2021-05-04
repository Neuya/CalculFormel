import random

def Mystere(n):
	if squarefree_part(n)!=n:
		return 0
	F=factor(n)
	if len(F)<=1:
		return false
	for f in F:
		if f[1]>1:
			return false
	for f in F:
		if(n-1)%(f[0]-1) == 0:
			return false
	return true

def listeCarm(N):
	i=N
	k=2
	L=[]
	while(i!=0):
		if(Mystere(k)):
			L.append(k)
			i= i -1
		k+=1
	return L


def TestFermat(entier,temoin):
	A = IntegerModRing(entier)
	a=A(temoin)^(entier-1)
	return not(a==A(1))

def MTF(k,n):
	L= []
	t = random.randint(1,n-1)
	L.append(t)
	while k>0:
		#print(t)
		if(not TestFermat(n,t)):
			return 1
		while t in L:
			t = random.randint(1,n-1)

		L.append(t)
		k-=1
	return 0

def TestCarm(L):
	for l in L:
		print(l)
		k = l//8
		print(MTF(k,l))

#Retourne (e,q) tq n-1=2^e * q
def decompo(n):
	e=0
	q=n-1
	while 2.divides(q):
		e=e+1
		q=q//2
	return (e,q)


def Test_Rabin_Miller(n):
	A = IntegerModRing(n)
	(e,q) = decompo(n)
	#print((e,q))
	L = []
	t = random.randint(2,n-2)
	L.append(t)
	k=n//8
	while k > 0:
		test1 = (A(t)^q == A(1))
		if(not test1):
			for i in range(0,e):
				test2 = (A(t)^((2^i)*q) == A(-1))
				if(test2):
					break
			if(not test2):
					return 1
		while t in L : 
			t = random.randint(2,n-2)
		L.append(t)
		k-=1
	return 0

def Test_Rab(Entier,Temoin,e,q):
	b=mod(Temoin,Entier)^(q)
	if b == mod(1,Entier) or b==mod(-1,Entier):
		return 0
	i=0
	for i in range(e):
		b=b^2
		if b == mod(-1,Entier):
			return 0
	return 1

def MRB(L):
	for l in L:
		print(l)
		print(Test_Rabin_Miller(l))

def Menteurs(Entier):
	(e,q) = decompo(Entier)
	L = []
	for i in range(1,Entier):
		if(Test_Rab(Entier,i,e,q)==0):
			L = L + [i]
	return euler_phi(Entier),len(L),L
def Menteurs2(Entier):
	L = []
	for i in range(1,Entier):
		if(not TestFermat(Entier,i)):
			L = L + [i]
	return euler_phi(Entier),len(L),L