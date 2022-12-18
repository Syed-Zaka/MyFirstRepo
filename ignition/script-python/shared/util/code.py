def datasetToArray(dataset):
	pds = system.dataset.toPyDataSet(dataset)
	cols = list(dataset.getColumnNames())
	data = []
	for row in pds:
		values = {}
		for i in range(len(cols)):
			if cols[i] == "t_stamp":
				#system.util.getLogger("t_stamp").info("value: "+str(row[i])+", type:"+str(type(row[i])))
				#return ""
				values[cols[i]] = system.date.fromMillis(row[i].getTime())
			else:
				values[cols[i]] = row[i]
		data.append(values)
	return data
	

def getDatasetColumn(dataset, index=0):
	pyData = system.dataset.toPyDataSet(dataset)
	return pyData[0][index]