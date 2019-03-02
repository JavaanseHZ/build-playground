# Contract Service
Simple Java/Springboot REST application

## Description
* Supports CRUD operations on endpoint /api/contract
* [Example requests](https://github.com/JavaanseHZ/kafka-playground/tree/master/soap-ui) in soap-ui subfolder

### Model
```
id : uuid
type : string
premium : double
client
  firstname : string
  lastname : string
```

## Build Docker Image
```
gradle dockerBuildImage
```
