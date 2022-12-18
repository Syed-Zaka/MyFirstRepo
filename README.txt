Ignition 8.0 Demo Project Features

8.0Demo_Export.zip
This project file includes the Views that we have created for the features of the demo project.
Please note that some views will rely on additional data, including tags, session properties, etc, which may not be included with this set of files.

tags.json
These are the tags used in the Perspective demo project.
In order for most of these tags to work, you will need to set up your own device connections.
All of those devices are simulators that are included with Ignition.
Devices:
 Dairy (Simulator:Dairy Demo)
 Generic (Simulator:Generic)
 SLC (Simulator:SLC)
In addition to the devices, some tags use data from a SQL database. - see below

simulationTagData.sql (Demo)
telecom.sql (telecom)
These were exported from a MySQL server.
At least two DB connections will be needed, Demo and telecom.
Import these into your own Demo SQL server, inside the db with the matching (name).
This table contains data that will be read by some of the tags, as well as the map example.

