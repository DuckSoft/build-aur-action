FROM archlinux:latest
RUN pacman -Sy base-devel git --noconfirm && sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
