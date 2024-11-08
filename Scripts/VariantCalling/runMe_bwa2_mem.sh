#!/bin/bash

source /home/gas0042/mambaforge/bin/activate Bwa # bwa-mem2 2.2.1

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
INPUT_CSV="${ROOT_DIR}/data/input.csv"
GENOME="GCA_949782905.1_mRanTar1.h1.1_genomic.fna"
GENOME_FILE="${ROOT_DIR}/data/reference/${GENOME}"
INDEX="${ROOT_DIR}/data/reference/bwamem2/${GENOME}"
FASTP_DIR="${ROOT_DIR}/data/fastp"

mkdir -p ${ROOT_DIR}/data/bwamem2

# Run BWA-MEM2
while IFS="," read -r SAMPLE RAW POP
do

FASTQ="${FASTP_DIR}/${SAMPLE}.fq.gz"
BAM="${ROOT_DIR}/data/bwamem2/${SAMPLE}.bam"

sbatch <<- EOF
#!/bin/bash

#SBATCH --job-name=BWA2-mem_${SAMPLE}
#SBATCH --output=logs/BWA2-mem/BWA2-mem_${SAMPLE}-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/BWA2-mem/BWA2-mem_${SAMPLE}-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=10
#SBATCH --time=5-00
#SBATCH --mem=40G
#SBATCH -p jrw0107_std,general,nova

bwa-mem2 mem \
    -R "@RG\tID:${SAMPLE}\tSM:${SAMPLE}\tPL:Illumina" \
    -t 10 \
    ${INDEX} \
    ${FASTQ} \
    | samtools sort  --threads 10 -o ${BAM} -
EOF
done < <(tail -n +2 $INPUT_CSV)