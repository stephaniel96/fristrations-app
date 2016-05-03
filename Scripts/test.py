import sys
import json
from firebase import firebase




#specify path in put
clean_users = {}
fristrations = firebase.FirebaseApplication('https://fristrations.firebaseio.com', None)
users = fristrations.get('/user', None)

for details in users:
	details_dict = users[details]
	if "reservations" in details_dict:
		details_dict.pop("reservations")
	if details is not False:
		clean_users[details] = details_dict
	
for name in clean_users:
	print name
	print clean_users[name]
	fristrations.put('user', name, clean_users[name])

