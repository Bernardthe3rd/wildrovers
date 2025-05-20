#!/bin/bash

echo "🔄 Containers starten..."
docker-compose up -d --build

echo "⏳ Wachten op containers..."
sleep 10

echo "🎼 Composer dependencies installeren..."
docker exec -it laravel-app composer install

echo "🎨 NPM packages installeren..."
docker exec -it laravel-app npm install

echo "🔐 Laravel key genereren..."
docker exec -it laravel-app php artisan key:generate

echo "✅ Alles draait!"
echo "🌐 Laravel:  http://localhost:8000"
echo "🎨 Frontend: http://localhost:5173"
