#  Go Continuous Delivery Server Docker Image

Docker container defined to realize Go Continuous Delivery Server.


## GoCD Pipeline docker containers

* Go Continuous Delivery Server 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/go-cd-server/Dockerfile)
* Go Continuous Delivery Agent 17.7.0/[Dockerfile](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/go-cd-agent/Dockerfile)


#### How does it work?

It is a Continuous Delivery system. For more information please refer to [Go Continuous Delivery Web Site](https://www.gocd.org/)


### Docker images and execution

This system is a Server/Agent nodes, just to take a look we have already defined a couple of examples :

* [Local build docker compose file](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/docker-compose-dev.yml)
* [Remote Git Hub Repo compose file](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/docker-compose-dev.yml)


## Docker environment

*VOLUMES:*

* `/usr/lib/go-server/plugins/external` : Volume containing external plugins
* `/usr/lib/go-server/logs` : Volume containing log files
* `/usr/lib/go-server/artifacts` : Volume containing built artifacts

*PORTS:*

* `8153` : Web Interface port
* `8154` : Client Agent Audit port


*VARIABLES:*

* `PLUGIN_FILE_URL` : Url containing plugin text list file (full qualified web url) or local volume file (`file://`<volume file path>) (default: "")
* `GOCD_FILE_URL` : Url containing configuration file text list file (full qualified web url) or local volume file (`file://`<volume file path>) (default: "")


### Configurations file format

Go Continuous Delivery Server configuration file ( defined in variable `GOCD_FILE_URL`) will contain per line remote url path and local file path, in order to override remote local files by remote ones. That's a kind of tele-configuration. File in configuration can be also auxiliary files, not part of initial Go Continuous Delivery Server configuration.

File format :
http(s)://my-url-to-path/myfile1.xxx=my-local-path/myfile1.xxx
http(s)://my-other-url-to-path/myfile2.xxx=my-other-local-path/myfile2.xxx

For instance you can take example from [sample configuration file](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/samples/systemfiles-list.txt).


Go Continuous Delivery Server Plugin list file ( defined in variable `PLUGIN_FILE_URL`) will contain per line remote url path. That's a kind of tele-configuration. File in plugin at the moment can be only compiled files (jar), because on-flight build process is not yet provided.

File format :
http(s)://my-url-to-path/my-plugin-file1.jar
http(s)://my-other-url-to-path/my-plugin-file2.jar

For instance you can take example from [sample plugin file](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/samples/plugins-list.txt).


### Build and run docker container

Execution from docker hub :

```bash
  docker run -d -it --name go-cd -p 8153:8153 -p 8154:8154 -e "PLUGIN_FILE_URL=https://path-to-plugin-file/plugins-list.txt" -e "GOCD_FILE_URL=https://path-to-configuration-files-list-file/systemfiles-list.txt"  hellgate75/gocd-server:17.7.0
```


Build docker image (in folder [/go-cd-server](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/go-cd-server) ) :

```bash
  docker build --rm --force-rm --tag gocd-server:17.7.0 ./
```


Execution of local docker image :

```bash
  docker run -d -it --name go-cd -p 8153:8153 -p 8154:8154 -e "PLUGIN_FILE_URL=https://path-to-plugin-file/plugins-list.txt" -e "GOCD_FILE_URL=https://path-to-configuration-files-list-file/systemfiles-list.txt"  gocd-server:17.7.0
```


### LICENSE

[LGPL v.3](https://github.com/hellgate75/gocd-pipeline/tree/17.7.0/LICENSE)
