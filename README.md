# A Flask docker container with HTTPS boilerplate
A simple docker(-compose) container with nginx and auto renewal https from letsencrypt for uwsgi applications.

# How to use?
Replace all occurrences of \<domain\> with your domain in the **flask-site-nginx.conf** and **init-letsencrypt.sh** files.
  
Replace \<email\> with your email in the **init-letsencrypt.sh** file.

Then simply place your application inside the application folder, or replace the application folder with whatever your application folder is called and modify the **wsgi.py** file to get the ***app*** object from your folder.

# File Structure and Explanation
```
Root 
├── application
│   ├── \_\_init\_\_.py
│   └── router.py
├── Dockerfile
├── docker-compose.yml
├── flask-site-nginx.conf
├── nginx.conf
├── init-letsencrypt.sh
├── requirements.txt
├── supervisord.conf
├── uwsgi.ini
├── wsgi.py
└── [...]
```
* __application__: Simple test flask application. This is where you'd place your application
* __Dockerfile__: Dockerfile to assemble image with nginx, supervisord and uwsgi
* __docker-compose.yml__: Compose file for certbot and application container open on port 80 and 443
* __flask-site-nginx.conf__: Basic nginx site configuration for application with https
* __nginx.conf__: Standard nginx configuration with daemon off.
* __init-letsencrypt.sh__: modified script from wmnnd to build container, fix ssl certificate and start the application and certbot container
* __requirements.txt__: A document containing all required pip packages for your application
* __supervisord.conf__: Basic supervisord configuration for uwsgi and nginx
* __uwsgi.ini__: Uwsgi configuration
* __wsgi.py__: Application start file that uwsgi will run

# Contribute
When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. 

Please note we have a code of conduct, and follow it in all your interactions with the project.

## Pull Request Process
1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent.
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you.

## Code of Conduct
This project and everyone participating in it is governed by the Code of Conduct expected to uphold this code.

# Credits
Https made possible by letsencrypt and [nginx-certbot](https://github.com/wmnnd/nginx-certbot)
