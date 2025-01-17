
mkdir -p /data/$USER/jupyter
cd /data/$USER/jupyter
module load jupyter
module load rpy2
jupyter lab --ip localhost --port $PORT1 --no-browser
