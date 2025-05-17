#!/bin/bash
set -e

echo "Configurant la base de dades..."

# Variables per defecte
DB_HOST=${DATABASE_HOST:-localhost}
DB_USER=${DATABASE_USERNAME:-postgres}
DB_PASS=${DATABASE_PASSWORD:-postgres}
DB_NAME="marcus_development"

echo "Host: $DB_HOST"
echo "User: $DB_USER"
echo "Database: $DB_NAME"

# Comprovar si Postgres està accessible
echo "Comprovant connexió a Postgres..."
PGPASSWORD=$DB_PASS psql -h $DB_HOST -U $DB_USER -d postgres -c '\q' 2>/dev/null

if [ $? -ne 0 ]; then
  echo "ERROR: No es pot connectar a la base de dades Postgres en $DB_HOST amb l'usuari $DB_USER"
  exit 1
fi

echo "Connexió OK. Creant base de dades si cal..."
bundle exec rails db:create

echo "Migracions..."
bundle exec rails db:migrate

echo "Seed de la base de dades..."
bundle exec rails db:seed

echo "Base de dades preparada!"
