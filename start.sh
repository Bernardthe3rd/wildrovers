#!/bin/bash

echo "🧹 Vorige containers en volumes opruimen..."
docker-compose down -v --remove-orphans

echo "🐳 Docker images opschonen (alleen dangling)..."
docker image prune -f

echo "🔄 Containers starten..."
docker-compose up --build

echo "⏳ Wachten op containers..."
sleep 10

echo "🎼 Composer dependencies installeren..."
docker exec -it laravel-app composer install

echo "🎨 NPM packages worden in de Vite container geïnstalleerd..."

echo "🔐 Laravel key genereren..."
docker exec -it laravel-app php artisan key:generate

echo "✅ Alles draait!"
echo "🌐 Laravel:  http://localhost:8000"
echo "🎨 Frontend: http://localhost:5173"
