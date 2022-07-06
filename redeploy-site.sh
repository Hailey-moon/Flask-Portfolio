#!/bin/bash

# Makes sure git repo inside the VPS has the latest changes from the main branch on github
cd Flask-Portfolio
git fetch && git reset origin/main --hard

# Spin containers down to prevent out of memory issues on our VPS instances when building in the next step
docker compose -f docker-compose.prod.yml down

docker compose -f docker-compose.prod.yml up -d --build