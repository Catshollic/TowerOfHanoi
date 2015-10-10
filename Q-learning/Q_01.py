aryNum = 7
ganma = 0.1
arufa = 0.5
r = 0
learnCount = 10
ary = [0,0,0,0,0,0,0]

#print(ary)
for i in range(learnCount):
	print('')
	for i in range(aryNum):
		if i == aryNum-1:
			r += 1
			ary[i] = ary[i]+arufa*( r + ganma*0) - ary[i]
			print(round(ary[i],3)),
			print(r)
		else:
			ary[i] = ary[i]+arufa*( r + ganma*ary[i+1]) - ary[i]
			print(round(ary[i],3)),
		
