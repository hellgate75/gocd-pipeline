# Go Continuous Delivery Server Docker Agent Image

Docker container defined to realize Go Continuous Delivery Server Agent.


## GoCD Pipeline docker containers

* Go Continuous Delivery Server 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/go-cd-server/Dockerfile)
* Go Continuous Delivery Agent 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/go-cd-agent/Dockerfile)


#### How does it work?

It is a Continuous Delivery system. For more information please refer to [Go Continuous Delivery Web Site](https://www.gocd.org/)


### Docker images and execution

This system is a Server/Agent nodes, just to take a look we have already defined a couple of examples :

* [Local build docker compose file](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/docker-compose-dev.yml)
* [Remote Git Hub Repo compose file](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/docker-compose-dev.yml)


## Docker environment

*VOLUMES:*

None


*PORTS:*

None


*VARIABLES:*

* `GO_SERVER_URL` : Url containing Go Countinuous Deliver Server access (usually https://my-server:8154/go) (default: "")
* `GO_AGENT_STARTUP_DELAY` : Number of seconds for Agent wait before to start (in case dynamic cloud configuration) (default: "")


### Build and run docker container

Execution from docker hub :

```bash
  docker run -d -it --name go-cd-agent -e "GO_SERVER_URL=https://localhost:8154/go" hellgate75/gocd-agent:17.7.0
```


Build docker image (in folder [/go-cd-agent](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/go-cd-agent) ) :

```bash
  docker build --rm --force-rm --tag gocd-agent:17.7.0 ./
```


Execution of local docker image :

```bash
  docker run -d -it --name go-cd-agent  -e "GO_SERVER_URL=https://localhost:8154/go"  gocd-agent:17.7.0
```


### LICENSE

[LGPL v.3](https://github.com/hellgate75/gocd-pipeline/tree/1.17.0/LICENSE)
