FROM martynas/archlinux:latest

# update package index to the latest (common issue for all archlinux docker image)
RUN pacman -Syu --noconfirm
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
