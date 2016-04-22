import sys
from firebase import firebase

firebase = firebase.FirebaseApplication('https://fristrations-app.firebaseio.com', None)


#specify path in put
for router in sys.stdin:
	info = router.split()
	result = firebase.put("router_data/router_info", info[1], {'num_devices':info[2], 'room':'frist 209'})
