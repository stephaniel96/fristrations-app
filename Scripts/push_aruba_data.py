from firebase import firebase

firebase = firebase.FirebaseApplication('https://fristrations.firebaseio.com', None)

result = firebase.post('/dillon_gym', '10', {'print': 'pretty'}, {'X_FANCY_HEADER': 'VERY FANCY'})

print result