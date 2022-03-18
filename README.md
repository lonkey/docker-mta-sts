# Docker MTA-STS

This docker-compose script uses linuxserver/swag to publish an MTA-STS policy. MTA-STS improves security by requiring authentication checks and encryption for email sent to your domain.

Customize the `docker-compose.yml` file to your needs and run the following commands:

```shell
sudo docker-compose -f docker-compose.yml build --no-cache
sudo docker-compose -f docker-compose.yml up -d
sudo docker system prune --all --force
```
