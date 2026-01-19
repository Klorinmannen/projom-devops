## Docker
* ``docker run --name <new-container-name> -d httpd:2.4``
* ``docker compose up -d --build``
* ``docker exec <container-name> <command>``
* * ``docker exec -it <container-name> bash|sh``
* ``docker ps -a``
* ``docker prune -f --filter status=exited``
* ``docker start <container-name>``
* ``docker restart <container-name>``
* ``docker stop <container-name>``