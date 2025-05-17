#!/bin/bash
set -e

# Crear la base de dades si no existeix
bundle exec rails db:prepare

# Llençar el servidor
exec "$@"
