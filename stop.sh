#!/bin/bash

echo "🛑 Containers en volumes stoppen en opruimen..."
docker-compose down -v --remove-orphans

echo "✅ Containers gestopt en opgeruimd."
