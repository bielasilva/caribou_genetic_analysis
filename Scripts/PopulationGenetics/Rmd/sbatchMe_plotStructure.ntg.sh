#!/bin/bash

#SBATCH --job-name=KnitStructure_ntg
#SBATCH --output=logs/Structure-ntg-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Structure-ntg-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=2
#SBATCH --time=5-00
#SBATCH --mem=10G
#SBATCH -p jrw0107_std,general,nova
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=gabriel.silva@auburn.edu

source /home/gas0042/mambaforge/bin/activate Rmarkdown

ROOT_DIR="/mmfs1/scratch/CaribouProject"

cd ${ROOT_DIR}/analysis/structure/ntg

Rscript -e "rmarkdown::render('Plot_structure-ntg.Rmd')"