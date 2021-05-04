import random


def completeToN(P,n):
	if(len(P)<n):
		for i in range(len(P)-1,n):
			P.append(0)




def Karatsuba(P,Q,n):
	if n == 1:
		return [P[0]*Q[0],0]
	
	completeToN(P,n)
	completeToN(Q,n)
	m = n//2
	P_0 = P[0:m]
	P_1 = P[m+1:n]
	Q_0 = Q[0:m]
	Q_1 = Q[m+1:n]
	S_1 = [P_0[i]+P_1[i] for i in range(0,m)]
	S_2 = [Q_0[i]+Q_1[i] for i in range(0,m)]
	R1 = Karatsuba(P_0,Q_0,m)
	R2 = Karatsuba(P_1,Q_1,m)
	R3 = Karatsuba(S_1,S_2,m)
	M=[]
	for i in range(n):
		M.append(R3[i]-R2[i]-R1[i])
	Z=[]
	for i in range(m):
		Z.append(0)
	U1 = R1 + Z + Z
	U2 = Z + M + Z
	U3 = Z + Z + R2
	R = []
	for i in range(2*n):
		R.append(U1[i]+U2[i]+U3[i])
	return R



def generateRandomList(n):
	return random.sample(range(1,n+1),n)

def division(L,n):
	return L[0:(n//2)],L[(n//2):n]

def fusion(L1,L2):
	L = []
	i1 = 0
	i2 = 0
	boole = true
	while(boole):
		if(i2==len(L2)):
			return L+L1[i1:len(L1)]
		if(i1==len(L1)):
			return L+L2[i2:len(L2)]
		if(L1[i1]<=L2[i2]):
			L.append(L1[i1])
			i1+=1
		else:
			L.append(L2[i2])
			i2+=1
		if(i1>=len(L1) and i2>=len(L2)):
			boole=false
	return L


def trifusion(L):
	n = len(L)
	if n==1 :
		return L
	L1 = L[:n//2]
	L2 = L[n//2:n]
	L1 = trifusion(L1)
	L2 = trifusion(L2)
	return fusion(L1,L2)


def triNaif(L):
	Lint= L[:]
	Lret = []
	i = 0
	while(i<len(L)):
		mini = Lint[0]
		for j in range(0,len(L)-i):
			if(mini>Lint[j]):
				mini = Lint[j]
		Lret.append(mini)
		Lint.remove(mini)
		i+=1
	return Lret




