aryNum = 10
ganma = 0.1
arufa =1.0
r = 0
learnCount = 10
ary = [0]*10

#print(ary)
for i in range(learnCount):
	print('')
	for i in range(aryNum):
		if i == aryNum-1:
			r += 1
			ary[i] = ary[i]+arufa*( r + ganma*0) - ary[i]
			print('%d == %0.3f' % (i+1,round(ary[i],3))),
			print('reward == %d'  % r)
		else:
			ary[i] = ary[i]+arufa*( r + ganma*ary[i+1]) - ary[i]
			print('%d == %0.3f' % (i+1,ary[i]))
		
