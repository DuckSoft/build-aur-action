FROM martynas/archlinux:latest

# enable multilib repo and hack makepkg to run under root user
RUN sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf && pacman -Syu base-devel git --noconfirm --overwrite '*' && sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
