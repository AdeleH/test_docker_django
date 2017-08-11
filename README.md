# Test Docker+Django

A very basic simple Django app with Docker


## Build and push the app image

- Create the image

```
$> docker build -t djangoapp .
```

- Push the image

```
$> docker tag djangoapp adeleh/djangoapp

$> docker login 

$> docker push adeleh/djangoapp
```


## Run the app

```
$> docker-compose up
```

N.B. Go inside a container via te cmd line

```
$> docker exec -it CONTAINER_ID bash
```

Check out http://localhost:8000/


## Scale the app

```
$> docker swarm init

$> docker stack deploy -c docker-compose.yml djangoapp

$> docker stack ps djangoapp  # all running containers of the app

$> docker stack rm djangoapp  # stop the app 
```


## Swarm cluster

3 nodes, 1 swarm manager and 2 workers

```
$> docker-machine create --driver virtualbox myvm3

$> docker-machine start myvm1

$> docker-machine ssh myvm1 "docker swarm init --advertise-addr myvm1_ip:2376"

$> docker-machine ssh myvm2 "docker join --token TOKEN myvm1_ip:2377"
$> docker-machine ssh myvm3 "docker join --token TOKEN myvm1_ip:2377"

$> docker-machine ssh myvm1 "docker node ls"  # check there are 3 nodes

$> docker-machine scp docker-compose.yml myvm1:~  # copy the file

$> docker-machine ssh myvm1 "docker stack deploy -c docker-compose.yml djangoapp"  # deploy the app on the cluster

or 

$> docker-machine ssh myvm1 "docker login -u adeleh -p pwd docker stack deploy -c docker-compose.yml djangoapp"  # if image is private

$> docker-machine ssh myvm1 "docker stack ps djangoapp -f "desired-state=Running""  # show the distributed containers between the nodes of the cluster

```

Check out myvm2_ip:8000


