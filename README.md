# Container Monitors

This project is a set of docker containers which should act as a standalone 
setup for monitoring the performance of any other docker containers currently 
running on your local system. It's still a work in progress, but the aim is for
this to require minimal or no modification to the containers being monitored. 

## Getting Started

To begin, you'll need to add the Loki plugin to your installed 
version of Docker. From any directory, run the following:

```
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

Once that is complete, pull the container code into a dedicated 
directory in your local system. From a terminal in that 
directory, run the following:

```
docker-compose up
```

This will start the containers and create the connections needed 
to process the container logs and metrics, which is handled by 
[Grafana](https://grafana.com/docs/grafana/latest/). Your 
Grafana admin space is available at http://localhost:9100. 
Navigating to Connections>Data Sources should show you that two 
data sources have already been provisioned: Loki and Prometheus. 
If these two data sources are not present, further configuration
may be needed. If the data sources are present, navigate to 
Dashboards to view the dashboard which has been provisioned: 
Test Dashboard. This dashboard presents consolidated logs across 
all active containers. 

If you regularly run containers from multiple projects, it is a 
good idea to pause or stop any containers which aren't essential
to monitoring. It is possible to further customize the project's 
configuration to your own needs if this is not possible, 
however. 

## Troubleshooting

### Port assignment conflicts

An issue might arise if your existing containers are already 
using ports which are assigned within this project. If that's 
the case, the containers won't be able to communicate with each 
other properly. In this case, it's a good idea to update the 
port assignment configuration within this project to a unique 
value.
