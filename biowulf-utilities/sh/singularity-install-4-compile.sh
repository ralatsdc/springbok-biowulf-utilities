# Install Singularity on Ubuntu: Step 4
# See:
#   https://docs.sylabs.io/guides/latest/admin-guide/installation.html#compile-singularity
pushd singularity
./mconfig && \
    make -C ./builddir && \
    sudo make -C ./builddir install
popd

# Source bash completion file
echo ". ~/singularity/singularity/builddir/bash-completion/completions/singularity" >> ~/.bashrc
