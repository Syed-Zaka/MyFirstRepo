# Get the Attendee ID from the database.
def getAttendeeID(deviceID):
	results = system.db.runNamedQuery("Get Attendee ID", {"deviceID": deviceID})
	system.util.getLogger("icc2018").info(str(dir(results)))
#	if len(results) > 0:
#		return results.getValueAt(0,0)
	return 0

	
def loginCheck(self):
	# Check to see if they have already logged in or this device is already registered.  If not, take them to the login page.
	
	attendeeID = self.session.custom.attendeeID
	deviceID = self.session.props.device.identifier
	
	# If we don't have the attendeeID session prop yet, check to see if their device is already registered
	if attendeeID == "" or attendeeID is None:
		attendeeID = system.db.runNamedQuery("OnlineDemo", "icc2018/Get Attendee ID", {"deviceID": deviceID})
		if attendeeID:
			self.session.custom.attendeeID = attendeeID
	
	# If they still don't have an attendeeID, direct them to the login page
	if attendeeID == "":
		system.perspective.navigate(page="/icc2018/logged-out")

def updateICCAttendees():
	import csv 
	path = system.file.openFile("csv")
	if path != None:
		f = open(path, "r")
		reader = csv.reader(f)
		reader.next()
		
		for row in reader:
			p = [row[i] for i in range(0, 13)]
			p.append(None)
			system.db.runPrepUpdate("INSERT IGNORE INTO icc_registrants (attendeeid, ticketcode, invoiceid, contactid, firstname, lastname, email, accountid, accountname, repname, type, ordertaken, deleted, deviceid) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)", p, "TreasureHunt")
			
		f.close()