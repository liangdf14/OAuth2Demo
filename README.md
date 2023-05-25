# Introduction
This is a project demonstrating how to use Spring Boot to implement OAuth2.0 authentication and authorization.

# Prerequisites
 - Docker

# Create Docker Image
```
docker build -t demo_vm .
```

If you are using M1 or M2 CPU Mac, you need to use `--platform linux/amd64` to run the command.
```
docker build --platform linux/amd64 -t demo_vm .
```

- Note: the step takes quite some time to finish. The time it needs depends on the spec of your machine. Please be patient.

# Start Docker
```
docker run -it \
--rm \
--name demo_vm \
-p 8080:8080 \
-p 8090:8090 \
-p 9000:9000 \
demo_vm
```

If you are using M1 or M2 CPU Mac, you need to use `--platform linux/amd64` to run command.
```
docker run -it \
--rm \
--name demo_vm \
--platform linux/amd64 \
-p 8080:8080 \
-p 8090:8090 \
-p 9000:9000 \
demo_vm
```

# Open in browser

When you see that the following logs output in the console log
```
...
Tomcat started on port(s): 8080 (http) with context path ''
...
```

You can open the following URL in the browser
```
http://localhost:8080
```

The username / password is `demo` / `password`.

You can also use your Github account to log in as well.


# How to check logs
```
docker logs demo_vm
```