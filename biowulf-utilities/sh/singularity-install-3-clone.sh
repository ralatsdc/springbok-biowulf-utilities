# Install Singularity on Ubuntu: Step 3
# Note:
#   Install from source did not work since the get-version script
#   expected to be run from the directory containing the singularity
#   repository
#
# See:
#   https://docs.sylabs.io/guides/latest/admin-guide/installation.html#checkout-code-from-git
# 
git clone --recurse-submodules https://github.com/sylabs/singularity.git && \
    cd singularity && \
    git checkout --recurse-submodules v4.2.1
