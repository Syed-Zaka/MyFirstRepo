def getNews():
	import xml.etree.ElementTree as ET
	#from java.util import Date
	#import traceback
	#import system
	
	#import xml.sax
	#import org.python.apache.xerces.parsers.SAXParser
	#import re
	
	url = "https://www.automationworld.com/blog/feed"
	header = ["Published", "Title", "Link", "Description"]
	data = []
	 
	#try:
	response = system.net.httpGet(url).encode("ascii", "ignore")
	dom = ET.fromstring(response)
	
	channel = dom.find("channel")
	items = list(channel.findall("item"))
	for node in items:
		title = node.find("title").text
		link = node.find("link").text
		pubDate = node.find("pubDate").text
		#<description> includes some unwanted debug-like data in this feed - trimming out that extra text 
		description = ''
		#image = False
		for descriptionItem in node.find("description").text.splitlines():
			if 'field-name-field-' not in descriptionItem:
				description += descriptionItem
			#else:
			#	if not image:
			#		try:
			#			image = re.search('<img(.+?)/>', descriptionItem).group(0)
			#		except:
			#			image = False
		description += '</div></div></div>'
		#if image:
		#	try:
		#		width = re.search('width=(.+?)"', image).group(0)
		#		height = re.search('height=(.+?)"', image).group(0)
		#		image = image.replace(width, 'width="200"').replace(height, '""')
		#	except:
		#		pass
			#description = image + description
		data.append([pubDate, title, link, description])
	return system.dataset.toDataSet(header, data)