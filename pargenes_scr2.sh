#!/bin/sh
#SBATCH --job-name=rax_concat
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sachamacias@ufl.edu 
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=8gb
#SBATCH --time=4:00:00
#SBATCH --output=logs/pargenes.%A.out
#SBATCH --error=logs/pargenes.%A.err
#SBATCH --qos=soltis-b
pwd; hostname; date

module load pargenes/1.2.0

cd /blue/soltis/sachamacias/hybpiper/paper1/hybpiper/MMinfo/genetreesNG/01/pargenes

pargenes-hpc-debug.py -a /blue/soltis/sachamacias/hybpiper/paper1/hybpiper/MMinfo/trimal/01/phylip \
		-o /blue/soltis/sachamacias/hybpiper/paper1/hybpiper/MMinfo/genetreesNG/01/pargenes/models/t220 \
		-c 8 -d nt -m \
                --modeltest-global-parameters /blue/soltis/sachamacias/hybpiper/paper1/hybpiper/MMinfo/genetreesNG/01/pargenes/globaloptions_pargenes_p.txt \
		-b 500 -p 20 -s 10 --modeltest-criteria BIC --use-astral --astral-global-parameters Astral_globaloptions_pargenes.txt --continue




date
