
# get the docker-compose.yml file from the minio/doctor repo
wget https://raw.githubusercontent.com/minio/doctor/master/docker-compose.yml
wget https://raw.githubusercontent.com/minio/doctor/master/.env

# If you want to start the services in production
RAILS_ENV=production docker-compose up -d

# If you want to start the services in development
docker-compose up -d

# get the container name of the web service
docker ps

# setup the database in a one-off command
docker exec docapp bundle exec rake db:setup
