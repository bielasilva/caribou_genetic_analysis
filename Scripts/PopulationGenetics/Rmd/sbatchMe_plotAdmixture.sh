#!/bin/bash

#SBATCH --job-name=PlotAdmixture
#SBATCH --output=logs/PlotAdmixture-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/PlotAdmixture-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=2
#SBATCH --time=5-00
#SBATCH --mem=10G
#SBATCH -p jrw0107_std,general,nova
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=gabriel.silva@auburn.edu

source /home/gas0042/mambaforge/bin/activate Rmarkdown

ROOT_DIR="/mmfs1/scratch/CaribouProject"

cd ${ROOT_DIR}/analysis/admixture/all

Rscript -e "rmarkdown::render('Admixture-plot.Rmd')"