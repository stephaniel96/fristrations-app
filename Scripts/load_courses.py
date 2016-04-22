import json
import datetime
from firebase import firebase

def main():
    with open('hello') as data_file:    
        input_courses = json.load(data_file)


    fb = firebase.FirebaseApplication('https://fristrations.firebaseio.com/rooms/', None)
    # print fb.get('frist114/times', None)
    

    dayNumber = datetime.datetime.today().weekday()
    if dayNumber == 0:
        dow = " M "
    elif dayNumber == 1:
        dow = " T "
    elif dayNumber == 2:
        dow = " W "
    elif dayNumber == 3:
        dow = " Th "
    elif dayNumber == 4:
        dow = " F "
    elif dayNumber == 5:
        dow = " S "
    else:
        dow = " Su "

    for x in input_courses:
        if x is not None:
            for y in x['classes']:
                if y is not None:
                    if dow in y['days']:
                        # room_times = "/" + y['roomnum'] +"/times"
                        room_times = '' + y['roomnum'] + '/times'
                        course = x['listings'][0]['deptANDnum']

                        # result = fb.get(room_times, '830')
                        # print room_times
                        # print result
                        start = int(y['Slabel'])
                        end = int(y['Elabel'])
                        while (start < end):
                            time1 = '' + str(start)
                            result1 = fb.put(room_times, time1, course)
                            if (time1.strip()[-2:] == '30'):
                                start += 70
                            else:
                                start += 30





# {"classes": [null, null, null, null, 
# {"Elabel": "1930", "roomnum": "frist228", "days": " T ", "Slabel": "1930"}, 
# {"Elabel": "830", "roomnum": "frist212", "days": " W ", "Slabel": "830"}, 
# null, null, 
# {"Elabel": "2300", "roomnum": "frist208", "days": " W ", "Slabel": "1100"}, 
# {"Elabel": "1330", "roomnum": "frist208", "days": " W ", "Slabel": "1330"}, 
# {"Elabel": "1500", "roomnum": "frist208", "days": " W ", "Slabel": "1500"}], 
# "listings": [{"deptANDnum": "AMS 101"}]}
    # print input_courses

main()