FROM ghcr.io/ublue-os/config:latest@sha256:fdce8e2736430cd16495a7ad5f85164b319da3ffefb0fc9585c9f798e46c9281 AS config
FROM quay.io/fedora/fedora-bootc:${MAJOR_VERSION:-42}

ARG IMAGE_NAME="${IMAGE_NAME:-achillobator}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-centos-workstation}"
ARG MAJOR_VERSION="${MAJOR_VERSION:-42}"
ARG SHA_HEAD_SHORT="${SHA_HEAD_SHORT:-}"

# Install GNOME
RUN dnf -y install \
-x PackageKit \
-x PackageKit-command-not-found \
-x gnome-software-fedora-langpacks \
 "NetworkManager-adsl" \
 "gdm" \
 "gnome-bluetooth" \
 "gnome-color-manager" \
 "gnome-control-center" \
 "gnome-initial-setup" \
 "gnome-remote-desktop" \
 "gnome-session-wayland-session" \
 "gnome-settings-daemon" \
 "gnome-shell" \
 "gnome-software" \
 "gnome-user-docs" \
 "gvfs-fuse" \
 "gvfs-goa" \
 "gvfs-gphoto2" \
 "gvfs-mtp" \
 "gvfs-smb" \
 "libsane-hpaio" \
 "nautilus" \
 "orca" \
 "ptyxis" \
 "sane-backends-drivers-scanners" \
 "xdg-desktop-portal-gnome" \
 "xdg-user-dirs-gtk" \
 "yelp-tools"


COPY system_files /
COPY build_scripts /var/tmp/build_scripts

RUN --mount=type=tmpfs,dst=/tmp --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms /var/tmp/build_scripts/build.sh
