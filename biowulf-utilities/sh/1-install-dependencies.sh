# See:
#   https://docs.sylabs.io/guides/latest/admin-guide/installation.html#install-from-source
# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
   autoconf \
   automake \
   build-essential \  # Missing from documentation
   cryptsetup \
   fuse \
   fuse2fs \
   git \
   libfuse-dev \
   libglib2.0-dev \
   libseccomp-dev \
   libtool \
   pkg-config \
   runc \
   squashfs-tools \
   squashfs-tools-ng \
   uidmap \
   wget \
   zlib1g-dev
