singularity push -U nsforest_latest.sif library://ralatsdio/nlm-kb/nsforest_latest.sif
singularity pull -U library://ralatsdio/nlm-kb/nsforest_latest.sif

#!/bin/bash

# Print usage.
usage() {
    cat << EOF

NAME
    d2s -- build/run/push a Singularity image based on a Docker image

SYNOPSIS d2s [-brp] [-v VERSION] [-u USER] [-c COLLECTION] IMAGE

DESCRIPTION
    Build, run, or push a singularity image based on a public Docker image given the
    image name, and optionally a version, user (of Docker Hub or Sylabs Singularity Container Services), and collection (for Sylabs Singularity Container Services).

OPTIONS

    -v IMAGE_VERSION
        The image version, defaults to "latest"
    -u DOCKER_USER
        The username of the Docker Hub account, defaults to
        "ralatsdio"

EOF
}

# Parse command line options.
IMAGE_VERSION="latest"
DOCKER_USER="ralatsdio"
while getopts ":v:u:h" opt; do
    case $opt in
	v)
	    IMAGE_VERSION=${OPTARG}
	    exit 1
	    ;;
	u)
	    DOCKER_USER=${OPTARG}
	    exit 1
	    ;;
	h)
	    usage
	    exit 1
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    usage
	    exit 1
	    ;;
	\:)
	    echo "Option -$OPTARG requires an argument." >&2
	    usage
	    exit 1
	    ;;
    esac
done

# Parse command line arguments.
shift `expr $OPTIND - 1`
if [ "$#" -ne 1 ]; then
    echo "Docker image name required"
    exit 1
fi
IMAGE_NAME=$1

# Build the Singularity image from the public Docker image
sudo singularity build \
     ${IMAGE_NAME}_${IMAGE_VERSION} \
     docker://ralatsdio/nsforest:latest


singularity shell ${IMAGE_NAME}_${IMAGE_VERSION}.sif

singularity push -U ${IMAGE_NAME}_${IMAGE_VERSION}.sif
 library://$USER_NAME/$COLLECTION_NAME/${IMAGE_NAME}_${IMAGE_VERSION}.sif
