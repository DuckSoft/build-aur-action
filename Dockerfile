FROM archlinux:latest
RUN pacman -Syu base-devel git --noconfirm && sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
