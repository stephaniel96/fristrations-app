import sys
from firebase import firebase

firebase = firebase.FirebaseApplication('https://fristrations.firebaseio.com', None)

for router in sys.stdin:
	info = router.split()
	result = firebase.put("router_data", info[1], info[2])
