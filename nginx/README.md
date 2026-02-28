
# Nginx Docker Sandbox

A Docker Compose setup for running multiple Nginx web applications.

## Services

### web-single
Host static website, site code is copied and modified into nginx image (See [Dockerfile.web](./Dockerfile.web) for more details). Open [localhost:8081](http://localhost:8081/) to see result.

### web-multi
Host 3 static websites (simple-webpage, html-arcade, simple-web-react). Site code isn't copied, however Nginx configuration customized in [nginx.conf](./nginx.conf).

### web-react
Host React application. Create containers by multistage building (first stage - building project using NodeJS, second - production with Nginx). See [Dockerfile](./Dockerfile) for more details.


## Web Applications

- [simple-webpage](http://localhost:8082/): Basic HTML/CSS site (*index.html for web-multi container index2.html for web-single container*)
- [html-arcade](http://localhost:8083/: JavaScript arcade game with modular class structure
- [simple-web-react](http://localhost:8084/): CDN React web application with component architecture
- [react-ts](http://localhost:8085/): React application which show free seats on specific event

## Usage

Start websites
```bash
make nginx_start
# start containers
```

Stop websites
```bash
make nginx_stop
# stop containers
```