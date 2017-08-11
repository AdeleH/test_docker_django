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


# Run the app

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
