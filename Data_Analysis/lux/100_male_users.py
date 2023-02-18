import requests

#Api request
res = requests.get('https://randomuser.me/api?results=100&gender=male')

#To python object
data = res.json()['results']

#Iterate using list comprehension
male = [user['name']['first'] for user in data]
print(male)

