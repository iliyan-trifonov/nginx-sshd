docker-nginx-sshd
=================

Just a skeleton to use when in need of a running nginx server with ssh/sftp/scp access to its file structure and shell.

Get the compiled image from the Docker Index here: https://index.docker.io/u/iliyan/docker-nginx-sshd/

---

Build it with:

`docker build -rm -t iliyan/docker-nginx-sshd .`

Start it with this command:

`docker run -d -name nginx iliyan/docker-nginx-sshd`

Find which ip is given to it:

`docker inspect nginx`

see if the sshd and nginx procs are running:

`docker top nginx`

and:

`docker logs nginx`

connect to the container while the nginx server is in the foreground (for example if `inspect nginx` gave you 172.17.0.2):

`ssh root@172.17.0.2` say yes to the fingerprint use password: `root`

remove the fingerprint if you rebuild the container:

`ssh-keygen -f "~/.ssh/known_hosts" -R 172.17.0.2`

Now you have full root ssh/sftp access to the container and can change the nginx configuration, install more software, upload a site or for more options: link (with docker) another container to this one, use data volumes and port forwarding.
