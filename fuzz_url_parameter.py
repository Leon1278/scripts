import requests

result = []
f = open("/usr/share/wordlists/rockyou.txt", "r")
counter = 0
counter_found = 0

for word in f:
    res = requests.get(f'http://192.168.189.247/pdfs/{word}.pdf')
    counter += 1
    if res.status_code == 200:
        result.add(word)
        counter_found += 1
        
print("####################Finished#######################")
print(f'Processed {counter} resquests, got {counter_found} hits!')
print(result)
