# Requirements


# Environmental
The following environmental variables must be populated, when running container

- DEPOT_USER,
- DEPOT_PASSWORD
- DEPOT_PASSWORD_SALT
- PUSHOVER_USER_KEY

# Ports
The following ports must be mapped, when running container

 - 8081 #webui listen
 - 6881-6891 #daemon listen ports

# Volumes
The following volumes must be mapped, when running container

- /srv/deluge/config
- /srv/deluge/data

- /mnt/blackhole
- /mnt/processing
- /mnt/downloads

The following subfolders should exist in the above mapped volumes:

- /mnt/blackhole/tvshows
- /mnt/blackhole/movies
- /mnt/blackhole/music
- /mnt/downloads/tvshows
- /mnt/downloads/movies
- /mnt/downloads/music

# References
- https://github.com/chamunks/alpine-rtorrent
- https://freedif.org/flood-modern-web-ui-for-rtorrent/
- https://superuser.com/questions/389621/rtorrent-different-default-save-directories-for-different-autolaunch-directori
- https://github.com/rakshasa/rtorrent/wiki/TORRENT-Watch-directories
- https://www.reddit.com/r/linux/comments/1s8kt1/rtorrent_how_to_watch_multiple_folders_and_save/
- https://github.com/rakshasa/rtorrent/wiki/Common-Tasks-in-rTorrent#move-completed-torrents-to-a-dynamic-location
- https://github.com/jfurrow/flood
- https://github.com/nickvanw/alpine-rtorrent/blob/master/Dockerfile
- https://github.com/Wonderfall/dockerfiles/blob/master/rtorrent-flood/Dockerfile
- https://github.com/nodejs/node-gyp/issues/1237


# TODO list

- [x] dynamic watch directories
	- [ ] [rename the torrent, once its loaded, delete the torrent when the torrent is complete](https://github.com/rtorrent-community/rtorrent-docs/blob/master/docs/examples/rename2tied.sh)
	- [x] auto-start watch directory torrents
- [x] download all torrents to /mnt/processing directory
- [?] redirect rtorrent daemon logs to STDOUT
- [x] move completed downloads into dynamic `/mnt/downloads` subdirectories. [1](https://rtorrent-docs.readthedocs.io/en/latest/use-cases.html#versatile-move) [2](https://github.com/rakshasa/rtorrent/wiki/Common-Tasks-in-rTorrent#move-completed-torrents-to-a-fixed-location)
- [ ] DEPOT default user/password authentication for webui
- [x] auto-labeling by watch folder compatible with flood
- [ ] [scheduling/QoS](http://rtorrent-docs.readthedocs.io/en/latest/use-cases.html#scheduled-bandwidth-shaping)
- [ ] Auto cleanup?
- [ ] [stop seeding when download is complete](https://github.com/rakshasa/rtorrent/wiki/Common-Tasks-in-rTorrent#move-completed-torrents-to-a-fixed-location)
- [ ] [Performance tuning](https://github.com/rakshasa/rtorrent/wiki/Performance-Tuning)
- [ ] logrotate
- [ ] better logging.