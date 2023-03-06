import requests
from bs4 import BeautifulSoup

#collecting the request
page = requests.get('https://www.jumia.co.ke/')
soup = BeautifulSoup(page.text, 'html.parser')

women = soup.find(class_='cat')
print(women)