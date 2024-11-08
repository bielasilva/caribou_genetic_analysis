#!/bin/bash

source /home/gas0042/mambaforge/bin/activate Fastp

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
INPUT_CSV="${ROOT_DIR}/data/input.csv"
FASTP_DIR="${ROOT_DIR}/data/fastp"

mkdir -p ${FASTP_DIR}/{logs,fail}
# Run BWA-MEM2
while IFS="," read -r SAMPLE RAW POP
do
sbatch <<- EOF
#!/bin/bash

#SBATCH --job-name=Fastp-${SAMPLE}
#SBATCH --output=logs/fastp/Fastp-${SAMPLE}-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/fastp/Fastp-${SAMPLE}-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=6
#SBATCH --time=5-00
#SBATCH --mem=5G
#SBATCH -p jrw0107_std,general,nova

fastp --in1 ${RAW} \
    --out1 ${FASTP_DIR}/${SAMPLE}.fq.gz \
    --json ${FASTP_DIR}/logs/${SAMPLE}.fastp.json \
    --html ${FASTP_DIR}/logs/${SAMPLE}.fastp.html \
    --failed_out ${FASTP_DIR}/fail/${SAMPLE}.fail.fq.gz \
    --thread 6 \
    --dont_eval_duplication --cut_right --cut_window_size 25 --cut_mean_quality 20 --trim_front1 6 --trim_poly_g
EOF
done < <(tail -n +2 $INPUT_CSV)