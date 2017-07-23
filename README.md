<p align="center"><img src="https://github.com/hellgate75/gocd-pipeline/tree/master/images/gocd_logo.png" width="255" height="255" /></p>

# GoCD Make up your Pipeline

Docker containers defined to realize Go Continuous Delivery Server.

## GoCD Pipeline docker containers

* Go Continuous Delivery Server 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/master/go-cd-server/Dockerfile)
* Go Continuous Delivery Agent 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/master/go-cd-agent/Dockerfile)

#### How does it work?

It is a Continuous Delivery system. For more information please refer to [Go Continuous Delivery Web Site](https://www.gocd.org/)

### Docker images and execution

This system is a Server/Agent nodes, just to take a look we have already defined a couple of examples :

* [Local build docker compose file](https://github.com/hellgate75/gocd-pipeline/tree/master/docker-compose-dev.yml)
* [Remote Git Hub Repo compose file](https://github.com/hellgate75/gocd-pipeline/tree/master/docker-compose-dev.yml)


Simulation will use fatures in following image containers :

* [Go Continuos Delivery Server](https://github.com/hellgate75/gocd-pipeline/tree/master/go-cd-server)
* [Go Continuos Delivery Server Agent](https://github.com/hellgate75/gocd-pipeline/tree/master/go-cd-agent)

Access information :
* Authorization user : admin/admin
* Access URL : https://localhost:8153/go
* Mannnual actions : Enable auto-logged client nodes in Agent Menu Section


### Running docker compose

If you want build images on your machine you can run, in project root, following command :

```bash
  docker-compose -f docker-compose-dev.yml up -d
```

And in this case if you want remove the exampler you can run, in project root, following command :

```bash
  docker-compose -f docker-compose-dev.yml down -v
```


If you want run directly github version of images on your machine you can run, in project root, following command :

```bash
  docker-compose up -d
```

And in this case if you want remove the exampler you can run, in project root, following command :

```bash
  docker-compose down -v
```


### LICENSE

[LGPL v.3](https://github.com/hellgate75/gocd-pipeline/tree/master/LICENSE)
