# README
This is a microservice that gets an ip adress and return the city & country that it's located at

### to run in development mode
* start local redis-server
* run  rails s

### to switch full/partial db
Full has more ip adresses, partial will take less time to process
* .env - DATABASE_COVERAGE=partial / full

## examples
* http://localhost:3000/v1/find-country?ip=1.0.4.44 => {"city":null,"country":"Australia"}
* http://localhost:3000/v1/find-country?ip=2001:2d8:e65d:2000:: => {"city":"Ansan-si","country":"South Korea"}
* http://localhost:3000/v1/find-country?ip=1.170.32.0 => {"city":"Xihu","country":"Taiwan"}
* http://localhost:3000/v1/find-country?ip=2.22.233.255 => {"city":null,"country":null}  (ip/geo info missing in this data base)