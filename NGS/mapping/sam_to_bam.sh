##!/usr/bin/env bash
#This Scipt Converts SAM file to BAM file
cd /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data
samtools view -Sb sample.sam > sample.bam
samtools sort sample.bam -o sample_sorted.bam
samtools faidx Chromosomes/referece_genome.fa
samtools index sample_sorted.bam
samtools rmdup sample_sorted.bam final_sorted.bam  # (rmdup -s for single reads)
