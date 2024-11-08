#!/bin/bash

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
INPUT_CSV="${ROOT_DIR}/data/input.csv"
RENAMED_DIR="${ROOT_DIR}/data/raw/renamed"

# Run BWA-MEM2
while IFS="," read -r SAMPLE RAW
do

ln -s ${RAW} ${RENAMED_DIR}/${SAMPLE}_raw.fq.gz

done < <(tail -n +2 $INPUT_CSV)