# Contract Service
Simple Java/Springboot REST application

## Description
* Supports CRUD operations on endpoint /api/contract

### Model
```
id : uuid
type : string
premium : double
firstname : string
lastname : string
```

## Build Docker Image
```
gradle dockerBuildImage
```
