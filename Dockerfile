FROM atbell/arch-base
MAINTAINER atbell

# install application
#####################

# update package databases for arch
RUN pacman -Sy --noconfirm

# run packer to install application
RUN packer -S btsync --noconfirm

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /data to host defined data path
VOLUME /data

# expose port for uwsgi
EXPOSE 45678

# add btsync supervisor config
ADD btsync.conf /etc/supervisor/conf.d/btsync.conf

# cleanup
#########

# completely empty pacman cache folder
RUN pacman -Scc --noconfirm

# remove temporary files
RUN rm -rf /tmp/*

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]
