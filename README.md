<h2>Study Project Nest JS</h2>
<h3>Run</h3>
<p>docker-compose up --build</p>
<p>docker compose exec db psql -U postgres -d oscar -c "INSERT INTO \"categories\" (\"name\") VALUES ('Best Picture'),('Best Actor'),('Best Actress'),('Best Supporting Actor'),('Best Supporting Actress'),('Best Director'),('Best Animated Feature Film'),('Best Animated Short Film'),('Best Documentary Feature Film'),('Best Documentary Short Film'),('Best Live Action Short Film'),('Best Casting'),('Best Cinematography'),('Best Costume Design'),('Best Film Editing'),('Best International Feature Film'),('Best Makeup and Hairstyling') ON CONFLICT (\"name\") DO NOTHING;"</p>
