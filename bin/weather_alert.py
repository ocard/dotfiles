#!/home/oc/anaconda3/bin/python

import json
import os


# if __name__ == "__main__":
def alerts():
    # weatherbit.json should be wgotten from
    # https://api.weatherbit.io/v2.0/forecast/hourly/?key='$WEATHERBIT_API_KEY'&ip=auto 
    with open(os.path.expanduser('~/.weatherbit.json'),'r') as w:
        data = json.load(w)
    
    l = data['data']
    txt = []
    for li in l:
        measure = li['weather']
        # https://www.weatherbit.io/api/codes
        raincodes = list(range(200,523))
        raincodes.remove(300) # light drizzle
        raincodes.remove(500) # light rain
        # raincodes.remove(520) # light shower rain
        
        if measure['code'] in raincodes:
            desc = measure['description'].lower()
            grad = 0
            if 'thunderstorm' in desc:  grad += 40
            if 'rain' in desc:          grad += 30
            if 'drizzle' in desc:       grad += 10
            if 'shower' in desc:        grad += 10
            if 'moderate' in desc:      grad += 20
            if 'heavy' in desc:         grad += 30
            if 'shower' in desc:        grad += 10
            if 'freezing' in desc:      grad += 30
            if grad > 100: grad = 100
            desc = measure['description']
            if grad > 50: desc = desc.upper()
            desc += ' ' + str(li['pop']) + '%'
            txt.append([li['timestamp_local'][5:16].replace('T',' '),desc,grad])
        else:
            txt.append([li['timestamp_local'][5:16].replace('T',' '),'clear',0])
    return txt
    # print(txt)