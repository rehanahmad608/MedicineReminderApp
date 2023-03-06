Medicine Reminder App
An Offline Medicine Reminder
Built with Flutter, Provider and BLoC pattern
Key Features
Homepage medicine list
Homepage containing all the registered Mediminders
Shared preference data storage
Storing medicine objects in shared preference
Medicine list retrieval upon application launch
JSON encoding and decoding
Adding new Mediminder, details include:
Medicine name
Dosage in milligrams
Medicine icon selection (Optional)
Reminder interval selection
Starting time using Time Picker
Notification reminding
Usage of Local Notifications to display Mediminders
Randomly-generated IDs for each notification
Daily reminders with set intervals, based on user preference
Registeration error checking
Name duplication check
Empty/not specified fields check
Medicine type is optional
Individual medicine detail page
In-depth details about each Mediminder upon tapping
Delete a Mediminder:
Erase the specified medicine object from shared preference and list
Erase corresponding scheduled notifications
