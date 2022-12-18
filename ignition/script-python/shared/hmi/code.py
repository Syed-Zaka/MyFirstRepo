def getHypoTankLevel(offset = 0):
	#597600 = 6 days, 22 hours
	# usage phase: y = A(t) + 4857, so that A will drain down to 940 each week
	# fill phase: y = B(t) - 324171, so that it will fill in the remaining two hours
	A = -0.00655455153949129852744310575636
	B = 0.54402777777777777777777777777778

	import datetime
	currentDate = datetime.datetime.now()
	
	import random
	
	timeThisWeek = currentDate.second
	timeThisWeek += currentDate.minute * 60
	timeThisWeek += currentDate.hour * 60 * 60
	timeThisWeek += currentDate.weekday() * 60 * 60 * 24
	timeThisWeek = (timeThisWeek + offset) % 604800

	if timeThisWeek < 597600:
		return A * timeThisWeek + 4857 + random.random()
	else:
		return B * timeThisWeek - 324171 + random.random()
		
def getDayTankLevel(offset = 0):
	# 10800 = 3 hours, 7200 = 2 hours
	# usage phase: y = A(t) + 1009.5, so that A will drain down to 970 in two hours
	# fill phase: y = B(t) + 891, so that it will fill in third hour
	A = -0.00548611111111111111111111111111
	B = 0.01097222222222222222222222222222

	import datetime
	currentDate = datetime.datetime.now()
	
	import random
	
	timeToday = currentDate.second
	timeToday += currentDate.minute * 60
	timeToday += currentDate.hour * 60 * 60
	timeToday = (timeToday + offset) % 10800

	if currentDate.hour % 3 < 2:
		# drain tank for two hours
		return A * timeToday + 1009.5 + random.random()
	else:
		# fill tank for one hour
		return B * timeToday + 891 + random.random()