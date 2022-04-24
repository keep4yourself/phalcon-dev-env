# phalcon-dev-env
Dev environment in Docker with Apache + PHP7 + Phalcon

This is part of a series of article hosted on keepforyourself.com
Article URL

https://keepforyourself.com/coding/php/dev-environment-in-docker-with-apache-php7-phalcon/

For building your image just download the Dockerfile into your local folder and run

```
docker build -t my-dev-env-phalcon4 .
```

For starting the environment run
```
docker run -v /Users/my-username/phalcon-app:/var/www/localhost/htdocs -p 8086:80 --name phalcon_app -d dev_env_apache_phalcon
```

More information on how to start and bootstrap a project can be found here
https://keepforyourself.com/coding/phalcon-project-from-scratch-step-by-step/
