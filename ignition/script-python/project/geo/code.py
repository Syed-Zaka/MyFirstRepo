def calculateDistance(lat1, lon1, lat2, lon2):
	from math import radians, cos, sin, asin, sqrt, atan2	
	lat1 = radians(lat1)
	lat2 = radians(lat2)
	lon1 = radians(lon1)
	lon2 = radians(lon2)
	dlon = lon2 - lon1 
	dlat = lat2 - lat1
	a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
	c = 2 * atan2(sqrt(a), sqrt(1-a))
	km = 6373.0 * c * 1000
	return km