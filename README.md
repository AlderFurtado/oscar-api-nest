# Study Project Nest JS
## Clone project and run (docker is required)

```bash
docker-compose up --build
```

### Add categories
```bash
docker compose exec db psql -U postgres -d oscar -c "INSERT INTO \"categories\" (\"name\") VALUES ('Best Picture'),('Best Actor'),('Best Actress'),('Best Supporting Actor'),('Best Supporting Actress'),('Best Director'),('Best Animated Feature Film'),('Best Animated Short Film'),('Best Documentary Feature Film'),('Best Documentary Short Film'),('Best Live Action Short Film'),('Best Casting'),('Best Cinematography'),('Best Costume Design'),('Best Film Editing'),('Best International Feature Film'),('Best Makeup and Hairstyling') ON CONFLICT (\"name\") DO NOTHING;"
```


### Check the API Swagger
#### Run project 
```bash
http://localhost:3000/api
```


### Next steps
[] Hashing Password User auth
[] Inputs Validation
[] Add Logging
[] Add Error Handling
[] Add version API
[] Add rate limit
[] Add Unit Test and E2E test
