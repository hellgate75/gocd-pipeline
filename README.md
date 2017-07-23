# GoCD Make up your Pipeline

Docker containers defined to realize Go Continuous Delivery Server.

## GoCD Pipeline docker containers

* Go Continuous Delivery Server 17.7.0/[Dockerfile](/go-cd-server/Dockerfile)
* Go Continuous Delivery Agent 17.7.0/[Dockerfile](/go-cd-agent/Dockerfile)

#### How does it work?

It is a Continuous Delivery system. For more information please refer to [Go Continuous Delivery Web Site](https://www.gocd.org/) 

### Docker images and execution

This system is a Server/Agent nodes, just to take a look we have already defined a couple of examples :

* [Local build docker compose file](/docker-compose-dev.yml)
* [Remote Git Hub Repo compose file](/docker-compose-dev.yml)


Simulation will use fatures in following image containers :

* [Go Continuos Delivery Server](/go-cd-server)
* [Go Continuos Delivery Server Agent](/go-cd-agent)

Access information : 
* Authorization user : admin/admin
* Access URL : https://localhost:8153/go
* Mannnual actions : Enable auto-logged client nodes in Agent Menu Section

### LICENSE

[LGPL v.3](/LICENSE)
