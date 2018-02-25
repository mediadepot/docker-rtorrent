#!/usr/bin/with-contenv bash

# make folders (Original)
mkdir -p \
	/srv/rtorrent/data/flood/db/ \
	/srv/rtorrent/data/session/ \
	/srv/rtorrent/data/torrents/


#TODO: for testing:
rm -rf /mnt/downloads/test1
rm -rf /mnt/downloads/test2
mkdir -p /mnt/downloads/test1 /mnt/downloads/test2 /mnt/blackhole/test1 /mnt/blackhole/test2
chown mediadepot:mediadepot /mnt/processing
chown mediadepot:mediadepot /mnt/downloads

# flood config file
[[ ! -f /srv/flood/app/config.js ]] && \
	cp /defaults/config.js /srv/flood/app/config.js
	#TODO: can we set the base user here?

# rtorrent configuration
if [ ! -f /srv/rtorrent/config/rtorrent.rc ]; then
	cp /defaults/rtorrent.rc /srv/rtorrent/config/rtorrent.rc

	# run a python script that appends the custom watch directories to the rc file.
	#do web and autoadd last, they require some extra data which we're going to generate
    python <<-HEREDOC
import os

# find all common directories in the downloads folder and the blackhole folder
download_subfolders = [os.path.basename(x[0]) for x in os.walk('/mnt/downloads')]
blackhole_subfolders = [os.path.basename(x[0]) for x in os.walk('/mnt/blackhole')]


with open('/srv/rtorrent/config/rtorrent.rc', 'a') as rcfile:
    for folder_name in list(set(download_subfolders).intersection(blackhole_subfolders)):
        line = r'schedule2 = watch_directory_{0}, 0, 10, "load.start=/mnt/blackhole/{0}/*.torrent,d.custom1.set={0}"'.format(folder_name)
        rcfile.write(line + "\n")

HEREDOC

fi

# delete lock file if exists
[[ -e /srv/rtorrent/data/session/rtorrent.lock ]] && \
	rm /srv/rtorrent/data/session/rtorrent.lock




# permissions
chown mediadepot:mediadepot -R /srv/rtorrent/data/
chown mediadepot:mediadepot -R /srv/rtorrent/config/



