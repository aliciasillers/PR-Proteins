#!/bin/bash
#
#SBATCH --job-name=interpro
#SBATCH --ntasks=4 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=22G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=interpro.out # File to which STDOUT will be written
#SBATCH --error=interpro.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=8:00:00

module load conda/latest
conda activate pr

interproscan.sh -f TSV -appl CDD,Gene3D,PANTHER,Pfam,PIRSF,SMART -i align_p_in.fa -b prs.interpro

