# desec-hook-certbot-docker
A (unofficial) docker container to automatically renew certificates with the desec.io certbot hook via dns challenge.

## Usage

### Build

Clone this repo and inside the project folder: 
`sudo docker image build -t desec-hook-certbot-docker .`

### RUN

```
  docker run \
    -d \
    --restart unless-stopped \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/log/letsencrypt:/var/log/letsencrypt" \
    -e "TZ=Europe/Berlin" \
    --env "DEDYN_TOKEN={DEDYN_TOKEN}" \
    --env "DEDYN_NAME={DEDYN_NAME}" \
    --env "DOMAINS={DOMAINS}" \
    --env "DOMAIN_EMAIL={DOMAIN_EMAIL}" \
    certbot-test
```
* Volumes and timezone (`TZ`) can be configured as you wish. Timezone is used for cron renewal.
* `{DEDYN_TOKEN}` a dedyn/desec token that's valid for the planned runtime of the container.
* `{DEDYN_NAME}` The domain you want a certificate for, "yourdomain.dedyn.io" or "example.com" depending on whether you use managed dns or dyndns.
* `{DOMAINS}` The domains you want a certificate for, seperated by space. 
* `{DOMAIN_EMAIL}` An email address where you can be reached to supply to Let's Encrypt.

#### Cron
The [crontab](crontab) file can be configured to run the renewal check at any time. Currently 04:00  (at night) is the default.

#### Example
```
  docker run \
    -d \
    --restart unless-stopped \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/log/letsencrypt:/var/log/letsencrypt" \
    -e "TZ=Europe/Berlin" \
    --env "DEDYN_TOKEN=abcxyzabcxyzabcxyz" \
    --env "DEDYN_NAME=example.com" \
    --env "DOMAINS=example.com *.example.com" \
    --env "DOMAIN_EMAIL=me@example.com" \
    certbot-test
```
Note, the email doesn't need to be the same domain. You can use gmail or whatever you want.

## More info

* [desec.io](desec.io)
* [desec.io certbot hook](https://github.com/desec-io/desec-certbot-hook)
* [desec.io how to use the certbot hook](https://desec.readthedocs.io/en/latest/dyndns/lets-encrypt.html)
* [Let's Encrypt](https://letsencrypt.org)
* [Certbot](https://certbot.eff.org/)

