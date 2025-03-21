#!/bin/bash
#
#SBATCH --job-name=format
#SBATCH --ntasks=1 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=10G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=format.out # File to which STDOUT will be written
#SBATCH --error=format.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1:00:00

awk '{print $4}' RR_PRs.bed | sed 's/^\(.\{11\}\)/\1\t/' > filefortags.bed
