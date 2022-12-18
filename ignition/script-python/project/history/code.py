def getSparklineData(tagPath, min=0, max=100, intervalMinutes=5, returnSize=100):
	ds = system.dataset.toPyDataSet(system.tag.queryTagHistory(paths=[tagPath], intervalMinutes=intervalMinutes, returnSize=returnSize))
	data = []
	for i in range(len(ds)):
		val = ds[i][1] if ds[i][1] is not None else 0.0
		
		r = 100.0 / float(max - min)
		offset = 0.0 - float(min * r)
		val = float(val * r) + offset
		
		if val != None:
			data.append("%d,%d" % (i, val))
	dataStr = " ".join(data)
	return dataStr
	
def getSparklineDataArray(tagPath, min=0, max=100, intervalMinutes=5, returnSize=100):
	ds = system.dataset.toPyDataSet(system.tag.queryTagHistory(paths=[tagPath], intervalMinutes=intervalMinutes, returnSize=returnSize))
	data = []
	for i in range(len(ds)):
		val = ds[i][1] if ds[i][1] is not None else 0.0
		
		r = 100.0 / float(max - min)
		offset = 0.0 - float(min * r)
		val = float(val * r) + offset
		
		if val != None:
			data.append(val)
	return data
	
def queryHistory(inTags, value, formatDate=False):
	ret = []
	
	tagPaths = [inTags[i].path for i in range(len(inTags))]
	tagPathAlias = [inTags[i].alias for i in range(len(inTags))]
	
	aggregationMode = None
	if value.calc != None and len(value.calc):
		aggregationMode = value.calc
	
	intervalMinutes = 1
	if value.interval.units == "min":
		intervalMinutes = value.interval.duration
	elif value.interval.units == "hour":
		intervalMinutes = value.interval.duration * 60
	elif value.interval.units == "day":
		intervalMinutes = value.interval.duration * 60 * 24
	
	data = None
	if value.mode == "realtime":
		rangeMinutes = 5
		if value.date.mostRecent.units == "min":
			rangeMinutes = value.date.mostRecent.duration
		elif value.date.mostRecent.units == "hour":
			rangeMinutes = value.date.mostRecent.duration * 60
		elif value.date.mostRecent.units == "day":
			rangeMinutes = value.date.mostRecent.duration * 60 * 24
		rangeMinutes = rangeMinutes if rangeMinutes < 20000 else 20000
		data = system.tag.queryTagHistory(paths=tagPaths, rangeMinutes=rangeMinutes,
		 intervalMinutes=intervalMinutes, aggregationMode=aggregationMode)
	elif value.mode == "historical":
		data = system.tag.queryTagHistory(paths=tagPaths, startDate=value.date.range.start,
		 endDate=value.date.range.end, intervalMinutes=intervalMinutes, aggregationMode=aggregationMode)
		
	if data != None:
		for i in range(data.getRowCount()):
			rowDict = {}
			
			if formatDate:
				rowDict["t_stamp"] = system.date.format(data.getValueAt(i, "t_stamp"), "yyyy-MM-dd HH:mm:ss")
			else:
				rowDict["t_stamp"] = data.getValueAt(i, "t_stamp")
				
			for j in range(len(tagPaths)):
				path = tagPaths[j]
				rowDict[tagPathAlias[j]] = data.getValueAt(i, j+1)
			ret.append(rowDict)
			if i >= 999:
				break
			
	return ret