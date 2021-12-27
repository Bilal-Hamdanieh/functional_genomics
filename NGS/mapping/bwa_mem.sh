##!/usr/bin/env bash
#This Script is used to map sequences to a reference genome using BWA-MEM
#Replace <options> by their correct file names and options

bwa mem -t 8 <Reference genome file ex: /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/Chromosomes/hg38.fa> \
-R '@RG\tID:rg1\tSM:NA12878\tPL:illumina\tLB:lib1\t:PU:H7AP8ADXX:1:TAAGGCGA' \ [OPTIONAL READ GROUP, REMOVE FOR EXAM IF NOT STATED TO PUT]
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<Trimmed paired R1 ex: NIST7035_trimmed_R1_paired.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<Trimmed paired R2 ex: NIST7035_trimmed_R2_paired.fastq.gz> \
> <Output SAM File name ex: /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/NIST7035_aln.sam>
