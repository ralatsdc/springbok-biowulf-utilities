
MEM=$1
sinteractive --gres=lscratch:${MEM} --mem=${MEM}g --tunnel
