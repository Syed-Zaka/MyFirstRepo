def getWeather(station):
	import system
	import xml.etree.ElementTree as ET
	
	currentData = {}
	
	# retrieve weather station data
	url = "https://w1.weather.gov/xml/current_obs/%s.xml" %station
	try:
		response = system.net.httpGet(url)
	
		# build ETree from XML response
		root = ET.fromstring(response)
	except:
		currentData['success'] = False
		currentData['location'] = ""
		currentData['temp'] = ""
		currentData['humidity'] = ""
		currentData['wind'] = ""
		currentData['date'] = ""
		currentData['icon'] = ""
		currentData['condition'] = ""
		currentData['timezone'] = "-0700"
		currentData['serverTimezone'] = int(system.date.getTimezoneOffset())
		return currentData
	
	currentData['location'] = root.find("location").text if root.find("location") is not None else ""
	
	currentData['temp'] = float(root.find("temp_f").text) if root.find("temp_f") is not None else 67.8
	
	currentData['humidity'] = float(root.find("relative_humidity").text) if root.find("relative_humidity") is not None else 0.0
	
	wind_dir = root.find("wind_dir").text if root.find("wind_dir") is not None else ""
	wind_mph = root.find("wind_mph").text if root.find("wind_mph") is not None else ""
	if wind_dir and wind_mph:
		currentData['wind'] = wind_mph + " mph " + wind_dir
	else:
		currentData['wind'] = ""
	
	url_base = root.find("icon_url_base").text if root.find("icon_url_base") is not None else ""
	url_name = root.find("icon_url_name").text if root.find("icon_url_name") is not None else ""
	currentData['icon'] = url_base + url_name
	
	currentData['condition'] = root.find("weather").text if root.find("weather") is not None else "Sunny"
	
	currentData['date'] = root.find("observation_time_rfc822").text if root.find("observation_time_rfc822") is not None else str(system.date.now())
	# timezone is at the end of the datetime string, -#### format
	currentData['timezone'] = int(currentData['date'][-5:-2])
	currentData['serverTimezone'] = int(system.date.getTimezoneOffset())
	currentData['success'] = True
		
	return currentData
