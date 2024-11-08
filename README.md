# Caribou Population Analysis in Alaska

## Authors

* Andrea Miranda Paez
* Gina Lamka
* Gabriel A. A. Silva
* Renae Sattler
* Dominic Demma
* Janna R. Willoughby

## Introduction

This repository hosts scripts and documentation for analyzing the caribou population in Alaska. The data and analysis were conducted as part of collaborative research involving Andrea Miranda and her team. This project includes raw data, quality control files, reference genome details, and a complete analysis pipeline.

## File Structure

The directory structure is organized as follows:

```bash
.
├── README.md
└── Scripts
    ├── runMe_rename.sh
    ├── sbatchMe_fastqc.sh
    ├── sbatchMe_multiqc.sh
    ├── PopulationGenetics/
    │   ├── Admixture/
    │   │   ├── runMe_admixture_ntg.sh
    │   │   ├── runMe_admixture.sh
    │   │   ├── sbatchMe_Plink_ntg.sh
    │   │   └── sbatchMe_Plink.sh
    │   ├── Rmd/
    │   │   ├── Adegenet-vcf.Rmd
    │   │   ├── Admixture-plot_ntg.Rmd
    │   │   ├── Admixture-plot.Rmd
    │   │   ├── sbatchMe_knitAdegenet.sh
    │   │   ├── sbatchMe_plotAdmixture.ntg.sh
    │   │   ├── sbatchMe_plotAdmixture.sh
    │   │   ├── sbatchMe_plotStructure.ntg.sh
    │   │   └── sbatchMe_plotStructure.sh
    │   └── Structure/
    │       ├── extraparams
    │       ├── mainparams
    │       ├── mainparams_ntg
    │       ├── PGDSpider-cli.log
    │       ├── runMe_Structure_ntg.sh
    │       ├── runMe_Structure.sh
    │       ├── sbatchMe_PGDSpdier.ntg.sh
    │       ├── sbatchMe_PGDSpdier.sh
    │       ├── seed.txt
    │       └── VCF-STRUCTURE_dip.spid
    └── VariantCalling/
        ├── runMe_bwa2_mem.sh
        ├── runMe_fastp.sh
        ├── sbatchMe_bcftools.sh
        ├── sbatchMe_bwa2-idx.sh
        ├── sbatchMe_freebayes.sh
        ├── sbatchMe_samtools-faidx.sh
        ├── sbatchMe_samtools-idx.sh
        └── sbatchMe_samtools-merge.sh
```

## Data

### Raw data

Raw FASTQ files are stored as symbolic links to the original files in the `data/raw/` directory.

### Quality Control

Quality control output files are stored in the `data/fastp/` directory.

### Reference genome

The reference genome used is **mRanTar1.h1.1** of _Rangifer tarandus_ (GenBank GCA_949782905.1), located in the `data/reference/` directory.

## Analysis Pipeline

The analysis process is structured into separate scripts found in the `Scripts/` directory. Each section below outlines the main steps and scripts involved:

### Variant Calling and Filtering

Scripts for quality control, read mapping, and variant calling are found in `Scripts/VariantCalling/`:

* Quality Control: `runMe_fastp.sh`
* Read Mapping:S
    * `sbatchMe_bwa2-idx.sh`
    * `runMe_bwa2_mem.sh`
    * `sbatchMe_samtools-merge.sh`
* Variant Calling:
    * `sbatchMe_samtools-faidx.sh`
    * `sbatchMe_samtools-idx.sh`
    * `sbatchMe_freebayes.sh`
* Filtering: `sbatchMe_bcftools.sh`

### Population Genetics Analysis

Scripts for running population genetics tools are in `Scripts/PopulationGenetics/`:

* Admixture Analysis (`Scripts/PopulationGenetics/Admixture/`):
    * `runMe_admixture.sh`
    * `runMe_admixture_ntg.sh`
    * `sbatchMe_Plink.sh`
    * `sbatchMe_Plink_ntg.sh`
* Adegenet Analysis: Found in `Scripts/PopulationGenetics/Rmd/` with R Markdown scripts like Adegenet-vcf.Rmd.
* STRUCTURE Analysis (`Scripts/PopulationGenetics/Structure/`):
    * `runMe_Structure.sh`
    * `runMe_Structure_ntg.sh`

List of Programs and Versions

* Fastp: 0.23.4
* BWA-MEM2: 2.2.1
* Samtools: 1.19.2
* BCFTools: 1.19
* Freebayes: 1.3.7
* Admixture: 1.3.0
* Plink: 1.90b6.21
* PGDSpider: 2.1.1.5
* Structure: 2.3.4
* FastQC: 0.11.9
* MultiQC: 1.25.1
