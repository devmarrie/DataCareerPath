# import the libraries
import requests
import csv
from bs4 import BeautifulSoup

# collecting the page
page = requests.get('https://web.archive.org/web/20121007172955/https://www.nga.gov/collection/anZ1.htm')
soup = BeautifulSoup(page.text, 'html.parser')

#Artist list
all_artists = soup.find(class_='BodyText')

artist_list = all_artists.find_all('a')

#csv file to write to
f = csv.writer(open('artists.csv', 'w'))
f.writerow(['Name','Link']
           
           )
for artist in artist_list:
    name = artist.contents[0]
    links = 'https://web.archive.org' +  artist.get('href')
    f.writerow([name,links])