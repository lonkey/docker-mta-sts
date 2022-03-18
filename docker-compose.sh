#!/usr/bin/env sh
sudo docker-compose -f docker-compose.yml build --no-cache
sudo docker-compose -f docker-compose.yml up -d
sudo docker system prune --all --force
exit 0
