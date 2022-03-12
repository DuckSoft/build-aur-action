FROM archlinux:latest
RUN sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf && \
    pacman -Syu base-devel base git pacman-contrib --noconfirm --overwrite '*' && \
	sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
