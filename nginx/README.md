
# Nginx

> Nginx is a high-performance web server and reverse proxy server widely used for serving static content, load balancing, and API gateway configurations.

This setup demonstrates multiple Nginx configurations:

- Static website copied directly into the container
- Configuration with three mounted volume directories and a custom nginx.conf
- React application example using a two-stage Dockerfile (build + production image)

The environment can be started with:

`make nginx_start`

and stopped with:

`make nginx_stop`

This section showcases different ways to configure and deploy web applications with Nginx inside Docker.

## Services

A Docker Compose setup for running multiple Nginx web applications.

### web-single
Host static website, site code is copied and modified into nginx image (See [Dockerfile.web](./Dockerfile.web) for more details). Open [localhost:8081](http://localhost:8081/) to see result.

### web-multi
Host 3 static websites (simple-webpage, html-arcade, simple-web-react). Site code isn't copied, however Nginx configuration customized in [nginx.conf](./nginx.conf).

#### Web Applications
- [simple-webpage](http://localhost:8082/): Basic HTML/CSS site (*index.html for web-multi container index2.html for web-single container*)
- [html-arcade](http://localhost:8083/): JavaScript arcade game with modular class structure
- [simple-web-react](http://localhost:8084/): CDN React web application with component architecture

### web-react
Host React application. Create containers by multistage building (first stage - building project using NodeJS, second - production with Nginx). See [Dockerfile](./Dockerfile) for more details. Open [localhost:8085](http://localhost:8085/) to see result.