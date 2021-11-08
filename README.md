# umbrel-install-linux

## Automating the instructions at [Install Umbrel](https://github.com/getumbrel/umbrel#-installation)

__Remember that this is not recommended as it's experimental at the moment.__

### Assumptions

* Using the latest Ubuntu
* Installs into the /opt folder
* Creates a service script
* Uninstall will only remove services and the /opt/umbrel folder
* Persistent data is put in /var/umbrel

### Instructions

* clone this project
* run umbrel-install.sh

### To persist the bitcoin data

* create the folder /var/umbrel/bitcoin
* edit /opt/umbrel/docker-compose.yml
* change bitcoin volumes  

```yaml

volumes:
    - /var/umbrel/bitcoin:/data/.bitcoin`
```

* change electrs volumes  

```yaml
volumes:
    - /var/umbrel/bitcoin:/data/.bitcoin:ro
```

### Start Umbrel
```bash
$ sudo systemctl start umbrel.service
```

### Stop Umbrel
```bash
$ sudo systemctl stop umbrel.service
```
