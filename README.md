# Docker-ns-letsencrypt

A Docker image to run Ryan Butler's [ns-letsencrypt script](https://www.techdrabble.com/citrix/18-letsencrypt-san-certificate-with-citrix-netscaler-take-2).

## Discussion
TBD

## Starting a container
```
docker run --name ns-letsencrypt \
        --mount type=bind,source=<path to data>,target=/root \
        xawen/ns-letsencrypt

```

## Configuration
Once the container is running, get the container ID
```bash
$ docker ps
```

Then, open a shell into it:
```bash
$ docker exec -it <contaner ID> bash
```

At that point, follow the diretions on Ryan's page.  Note that following steps are unnecessary as they're already in the image:
- Configure Linux Server: apt-get install python git python-pip curl
- Configure Linux Server: pip install requests
- Configure Linux Server: git clone --recursive https://github.com/ryancbutler/ns-letsencrypt
- Automate Renewal: All steps

