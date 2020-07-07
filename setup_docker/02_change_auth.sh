sudo groupadd docker
sudo usermod -aG docker $USER
docker container run --rm hello-world
