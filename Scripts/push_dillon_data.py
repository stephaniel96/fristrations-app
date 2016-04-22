import sys
from firebase import firebase

num_devices = raw_input()

firebase = firebase.FirebaseApplication('https://fristrations.firebaseio.com', None)
result = firebase.put("dillon_gym", "num_devices", num_devices)

