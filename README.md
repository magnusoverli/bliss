# Bliss

Bliss (http://www.blisshq.com) is an open source music library manager, that "makes your music library more browsable, searchable, playable and beautiful, whichever music players you use".

<img src="https://www.blisshq.com/images/bliss-large-album-art-macbook.png" alt="alt text" width="400">

### Usage
```
docker run -d --name=bliss --restart=unless-stopped \
-v /path/to/config/on/host:/config \
-v /path/to/music/on/host:/music \
-e PGID=1000 \
-e PUID=1000 \
-e TZ=Europe/Oslo \
-p 3220:3220 \
-p 3221:3221 \
magnusoverli/blisshq:latest
```

### Parameters
| Parameter     | Value        |
| ------------- |:-------------|
| `-d`          | Run the container in the background (daemon) |
| `--name=bliss`| The name of the container   |
| `--restart=unless-stopped`| Setting the restart policy of the container [More info](https://docs.docker.com/config/containers/start-containers-automatically/#use-a-restart-policy "Restart Policies") |
| `-v /config`  | Path to dir where Bliss stores config data, preferrably an empty directory.|
| `-v /music`   | Path to your music collection on the host  |
| `-e PUID=1000`| Setting UserID (see below)      |
| `-e PGID=1000`| Setting GroupID (see below)     |
| `-e TZ=Europe/Oslo`| Setting TimeZone to use for the container |
| `-p 3220:3220`     | Passing port 3220 on the host to port 3220 in the container (WebUI) |
| `-p 3221:3221`     | Passing port 3220 on the host to port 3220 in the container (Internal) |

##### PUID / PGID
These ID's are used to determine which user/group the container runs as. This is useful to have proper read/write permissions for the volumes (`-v`) we use. To find your UID (UserID) and GID (GroupID), run the following command as the user you want the container to run as:
```shell
$ id username
  uid=1000(username) gid=1000(groupname) groups=1000(groupname)...
```

### Start Application
Once the docker container is up and running you can access the WebUI at `host-ip-address:3200`.
Out of the box you have 100 fixes included as a trial, but I recommend that you buy the amount of fixes you need here: [Buy fixes](https://www.blisshq.com/buy-fixes.html)
