#!/usr/local/bin/python

import requests, json
import sys

def main():
    device_id = ""
    r1 = get_v3_devicelog()
    # print "r1 is:", json.dumps(r1, ensure_ascii=False)
    print "First device_id found is:", r1.get('data')[0].get('device_id')

    if r1 and len(r1) > 0:
        device_id = r1.get('data')[0].get('id')
        r2 = get_v3_devicelog_device_log_id(device_id)
    print "r2 is:", r2

    r3 = get_v3_devices()
    print "r3 is:", json.dumps(r3, ensure_ascii=False)

    if len(r3) > 0:
        device_id = r3.get('data')[0].get('id')
        r4 = get_v3_devices_id(device_id)
    print "r4 is:", json.dumps(r4, ensure_ascii=False)

def get_v3_devicelog():
    return execute_api_request('v3/devicelog/')

def get_v3_devicelog_device_log_id(id = None):
    return execute_api_request('v3/devicelog/' + id + '/')

def get_v3_devices():
    return execute_api_request('v3/devices/')

def get_v3_devices_id(id = None):
    return execute_api_request('v3/devices/' + id + '/')

def execute_api_request(endpoint):
    auth_t = token.encode("ascii", "ignore")
    headers = {
        'Authorization': "Bearer " + auth_t,
        'Content-Type': "application/json",
    }

    try:
        r = requests.get(url + endpoint, headers=headers, allow_redirects=False)
        print "Fetching", url + endpoint
        if r.status_code == 307:
            api_response = requests.get(r.headers['Location'], headers=headers, allow_redirects=False)
            if api_response.status_code == 200:
                return api_response.json()
        elif r.status_code == 200:
            return r.json()
        else:
            print "Got something other than a 200! " + str(r.status_code)
            return None
    except Exception as e:
        print(e)

def get_api_key():
    with open('api.key') as f:
        d = {}
        content = f.readlines()
        content = [x.strip() for x in content]
        for element in content:
            list = element.replace('"', '').split('=')
            d.update(dict(zip(list[0::2], list[1::2])))
        return (d.get('MBED_CLOUD_API_KEY'), d.get('MBED_CLOUD_API_ENDPOINT'))

if __name__ == "__main__":
    token, url = get_api_key()
    main()
