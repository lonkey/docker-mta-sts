FROM linuxserver/swag:version-1.18.0

ARG CLOUDFLARE_TOKEN
ARG STS_VERSION
ARG STS_MODE
ARG STS_MX_STRING
ARG STS_MAX_AGE

RUN apk add --no-cache \
    dos2unix

RUN mkdir -p /config-init/dns-conf; \
    { \
        echo "dns_cloudflare_api_token = $CLOUDFLARE_TOKEN"; \
    } > /config-init/dns-conf/cloudflare.ini; \
    \
    chmod 400 /config-init/dns-conf/cloudflare.ini

RUN mkdir -p /config-init/nginx/site-confs; \
    { \
        echo "#server_tokens off;"; \
        echo "etag off;"; \
        echo "more_clear_headers Date;"; \
        echo "more_clear_headers Last-Modified;"; \
        echo "more_clear_headers Server;"; \
        echo "more_clear_headers X-*;"; \
        echo "add_header Content-Security-Policy \"default-src 'self'\" always;"; \
        echo "add_header Permissions-Policy \"accelerometer=(), ambient-light-sensor=(), autoplay=(), battery=(), camera=(), cross-origin-isolated=(), display-capture=(), document-domain=(), encrypted-media=(), execution-while-not-rendered=(), execution-while-out-of-viewport=(), fullscreen=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), midi=(), navigation-override=(), payment=(), picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), sync-xhr=(), usb=(), web-share=(), xr-spatial-tracking=()\" always;"; \
        echo "add_header Referrer-Policy no-referrer always;"; \
        echo "add_header Strict-Transport-Security max-age=31557600 always;"; \
        echo "add_header X-Content-Type-Options nosniff always;"; \
        echo "add_header X-Frame-Options SAMEORIGIN always;"; \
        echo "add_header X-XSS-Protection \"1; mode=block\" always;"; \
    } > /config-init/nginx/site-confs/nginx-hardening.conf; \
    \
    chmod 400 /config-init/nginx/site-confs/nginx-hardening.conf

RUN mkdir -p /config-init/www/.well-known; \
    { \
        echo "version: $STS_VERSION"; \
        echo "mode: $STS_MODE"; \
        echo "$STS_MX_STRING"; \
        echo "max_age: $STS_MAX_AGE"; \
    } > /config-init/www/.well-known/mta-sts.txt; \
    \
    unix2dos /config-init/www/.well-known/mta-sts.txt; \
    \
    chmod 400 /config-init/www/.well-known/mta-sts.txt

RUN { \
        echo "#!/bin/sh"; \
        echo "cp -a /config-init/. /config/"; \
        echo "rm -rf /config/www/index.html"; \
        echo "/init"; \
    } > /config-init.sh; \
    \
    chmod 700 /config-init.sh

ENTRYPOINT ["/config-init.sh"]
