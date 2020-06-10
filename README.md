# Bliss

Bliss (http://www.blisshq.com) is an open source music library manager, that "makes your music library more browsable, searchable, playable and beautiful, whichever music players you use".

As I found only outdated images to install Bliss in docker, I decided to let this be my first attempt on making my own docker image.

### Installation
```
docker create --name=bliss \
-v /path/to/config/on/host:/config \
-v /path/to/music/on/host:/music \
-e PGID=1000 -e PUID=1000 \
-e TZ=Europe/Oslo \
-p 3220:3220 \
-p 3221:3221 \
magnusoverli/bliss:latest
```
