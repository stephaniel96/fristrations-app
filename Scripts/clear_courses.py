import json
import datetime
from firebase import firebase

def main():


    fb = firebase.FirebaseApplication('https://fristrations.firebaseio.com/rooms/', None)
    # print fb.get('frist114/times', None)
    

    result1 = fb.put('frist114/times', "100", "n/a")
    result1 = fb.put('frist114/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist114/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist205/times', "100", "n/a")
    result1 = fb.put('frist205/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist205/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    
    result1 = fb.put('frist206/times', "100", "n/a")
    result1 = fb.put('frist206/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist206/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist207/times', "100", "n/a")
    result1 = fb.put('frist207/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist207/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist208/times', "100", "n/a")
    result1 = fb.put('frist208/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist208/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist209/times', "100", "n/a")
    result1 = fb.put('frist209/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist209/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist210/times', "100", "n/a")
    result1 = fb.put('frist210/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist210/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist212/times', "100", "n/a")
    result1 = fb.put('frist212/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist212/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist227/times', "100", "n/a")
    result1 = fb.put('frist227/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist227/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist228/times', "100", "n/a")
    result1 = fb.put('frist228/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist228/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist232/times', "100", "n/a")
    result1 = fb.put('frist232/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist232/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist234/times', "100", "n/a")
    result1 = fb.put('frist234/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist234/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist240/times', "100", "n/a")
    result1 = fb.put('frist240/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist240/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist302/times', "100", "n/a")
    result1 = fb.put('frist302/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist302/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist303/times', "100", "n/a")
    result1 = fb.put('frist303/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist303/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist307/times', "100", "n/a")
    result1 = fb.put('frist307/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist307/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('frist309/times', "100", "n/a")
    result1 = fb.put('frist309/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('frist309/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    result1 = fb.put('fristB04B/times', "100", "n/a")
    result1 = fb.put('fristB04B/times', "130", "n/a")
    counter = 800
    while (counter < 2431):
    	time1 = str(counter)
    	result1 = fb.put('fristB04B/times', time1, "n/a")
        if (time1.strip()[-2:] == '30'):
            counter += 70
        else:
            counter += 30

    




main()