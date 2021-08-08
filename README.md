# Docker MTA-STS

This docker-compose script uses nginx to publish an MTA-STS policy. MTA-STS improves security by requiring authentication checks and encryption for email sent to your domain.

Customize the `docker-compose.yml` file to your needs and run the following commands:

```shell
sudo docker-compose -f /path/to/docker-mta-sts/docker-compose.yml build --no-cache
sudo docker-compose -f /path/to/docker-mta-sts/docker-compose.yml up -d
```
