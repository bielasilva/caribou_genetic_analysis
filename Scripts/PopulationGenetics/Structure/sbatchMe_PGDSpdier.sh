#!/usr/bin/env bash

#SBATCH --job-name=PGDSpider
#SBATCH --cpus-per-task=1
#SBATCH --partition=jrw0107_std,general,nova
#SBATCH --time=1:00:00              # Run time (D-HH:MM:SS)
#SBATCH --output=logs/PGDSpider-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/PGDSpider-%j.err           # Error file. %j is replaced with job ID

source /mmfs1/home/gas0042/mambaforge/bin/activate Structure

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables

IN_VCF="${ROOT_DIR}/data/vcf/Caribou.filtered.vcf"
OUTPUT="${ROOT_DIR}/analysis/structure/Caribou.str"
SPID="/home/gas0042/gabe_andy/VCF-STRUCTURE_dip.spid"

PGDSpider2-cli -inputfile $IN_VCF -inputformat vcf -outputfile $OUTPUT -outputformat structure -spid $SPID
