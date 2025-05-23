#!/bin/bash
#
#SBATCH --job-name=getfasta
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=getfasta.out # File to which STDOUT will be written
#SBATCH --error=getfasta.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=02:00:00

module load bedtools2

bedtools getfasta -fi ../Genome/farr1.fa -bed RR_PRs.bed -fo PRs.fa -nameOnly
