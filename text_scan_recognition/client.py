import requests

url = "http://127.0.0.1:5000"  # Replace with the server URL
file_path = "./recu.jpg"  # Replace with the path to your image file

files = {"image": open(file_path, "rb")}

response = requests.post(url, files=files)

print(response.text)
