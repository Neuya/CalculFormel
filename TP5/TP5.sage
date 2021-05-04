
def takeOddsEvenCoeff(P,a):
	L=[]
	for i in range(0,len(P)):
		if(i%2==a):
			L.append(P[i])
	return L

def FFT(P,w,n):
	if(n==1):
		return P

	P0 = takeOddsEvenCoeff(P,0)
	P1 = takeOddsEvenCoeff(P,1)

	m=n//2
	
	L0 = FFT(P0,w^2,m)
	L1 = FFT(P1,w^2,m)
	
	R=[0 for i in range(0,n)]
	interW = 1

	for k in range(0,m):
		R[k] = L0[k] + interW*L1[k]
		R[m+k] = L0[k] - interW*L1[k]
		interW = interW*w
	
	return R

def completeToN(P,n):
	if(len(P)<n):
		for i in range(len(P)-1,n):
			P.append(0)

def nettoie(L):
	while(L[len(L)-1]==0):
		L.pop(len(L)-1)
	return L


def prodFFT(P,Q,n):
	w = numerical_approx(exp(2*I*pi/n))

	completeToN(P,n)
	completeToN(Q,n)

	LP = FFT(P,w,n)
	LQ = FFT(Q,w,n)
	R = []
	for i in range(n):
		R.append(LP[i]*LQ[i])
	R = FFT(R,numerical_approx(w^(-1)),n)
	for i in range(n):
		R[i] = round(real(R[i]/n),0)
	return nettoie(R)