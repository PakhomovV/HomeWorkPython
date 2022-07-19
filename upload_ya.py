from pprint import pprint
import requests
import json

url = 'https://akabab.github.io/superhero-api/api/all.json'
par = {'name': 'Hulk', 'name': 'Captain America', 'name': 'Thanos'}
resp = requests.get(url, headers=par)


pprint(resp)



#def http_get () :

class YaUploader:
    def __init__(self, token: str):
        self.token = token

    def my_file (self, my_file):
        base_path = os.getcwd()
        full_path = os.path.join(base_path, my_file)

    def upload_get_link(self, file_path: str):
        upload_url = "https://cloud-api.yandex.net/v1/disk/resourses/upload"
        headers = self.get_headers()
        params = {'path': disk_file_pach, 'owerwrite': 'True'}
        response = requests.get(upload_url, headers=headers, params=params)
        return response.json()

    def upload_file_to_disk (self, disk_file_path, file_name):
        href = self.upload_get_link(disk_file_path=disk_file_path).get('href', '')
        response = requests.put(href, data=open(file_name, 'rb'))
        response.raise_for_status()
        if response.status_code == 201:
            print('Загружен')


if __name__ == '__main__':

   # ya.upload_file_to_disk(disk_file_path= 'new_file', file_name= my_file)

    #result = uploader.upload(path_to_file)