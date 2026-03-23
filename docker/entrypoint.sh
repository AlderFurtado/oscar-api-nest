#!/bin/sh
set -e

echo "Waiting for Postgres at ${DB_HOST:-db}:${DB_PORT:-5432}..."

# Wait until Postgres accepts connections (max ~60 s)
until pg_isready -h "${DB_HOST:-db}" -p "${DB_PORT:-5432}" -U "${DB_USER:-postgres}" -q 2>/dev/null; do
  sleep 1
done

echo "Postgres is up — running migrations..."
npx prisma migrate deploy

echo "Migrations applied — starting app..."
exec "$@"
