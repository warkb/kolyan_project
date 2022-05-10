docker build kolyan_project
docker-compose up -d
docker-compose exec web python ./kolyan_project/manage.py makemigrations
docker-compose exec web python ./kolyan_project/manage.py migrate
docker-compose down
docker-compose up