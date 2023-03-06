import requests
import csv

#Api request
res = requests.get('https://randomuser.me/api?results=100&gender=male')

#To python object
data = res.json()['results']
"""
csv file to write to
f = csv.writer(open('male.csv', 'w'))
f.writerow(['FirstName'])
"""  
#Iterate using list comprehension
male = [(user['name']['first'], user['location']['street']['number']) for user, in data]
print(male)
"""
iterate and write in csv
for m in male:
    f.writerow([m])
"""