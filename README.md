# Container Monitors

Drop-in Grafana, Loki, Promtail and Prometheus stack for monitoring Docker containers locally. Data sources and dashboards provisioned as code.

## Getting Started

To begin, you'll need to add the Loki plugin to your installed version of Docker. From any directory, run the following:

```
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

Once that is complete, clone this repo locally. Then spin up the containers from the `container-monitors`
directory:

```
docker-compose up -d
```

or

```
docker compose up -d
```

This will start the containers and create the connections needed to process the container logs and metrics, which is handled by [Grafana](https://grafana.com/docs/grafana/latest/). Your Grafana admin space is available at http://localhost:9100. Navigating to Connections>Data Sources should show you that two data sources have already been provisioned: Loki and Prometheus. If these two data sources are not present, further configuration may be needed. If the data sources are present, navigate to Dashboards to view the dashboard which has been provisioned: Test Dashboard. This dashboard presents consolidated logs across all active containers. 

In order to modify this for other projects, you will need to first make a copy of the Test Dashboard and then edit the panel showing the consolidated logs. Enter the values of all of the containers you wish to compare. If you regularly work on multiple projects, it is recommended that you make a copy of the Test Dashboard for each of these projects and list the necessary containers per project. 

If you regularly run containers from multiple projects, it is a good idea to pause or stop any containers which aren't essential to monitoring - try to monitor the containers of only one project at a time. It is possible to further customize the project's configuration to your own needs if this is not possible, however. 

## Troubleshooting

### Port assignment conflicts

An issue might arise if your existing containers are already 
using ports which are assigned within this project. If that's 
the case, the containers won't be able to communicate with each 
other properly. In this case, it's a good idea to update the 
port assignment configuration within this project to a unique 
value.
