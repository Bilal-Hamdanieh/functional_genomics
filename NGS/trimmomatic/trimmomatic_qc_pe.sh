##!/usr/bin/env bash
#This script is used to perform Quality Control on Paired End Reads
#Example:
#java -jar /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/trimmomatic-0.39.jar PE \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/mock_R1.fastq \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/mock_R2.fastq \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/qc_R1_paired.fastq.gz \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/qc_R1_unpaired.fastq.gz \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/qc_R2_paired.fastq.gz \
#/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/qc_R2_unpaired.fastq.gz \
#ILLUMINACLIP:/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10 \
#LEADING:3 \
#TRAILING:3 \
#MAXINFO:101:0.8 \
#SLIDINGWINDOW:4:15 \
#MINLEN:36
#Replace <option> by their true value for the given data set and remove any extra Trimmomatic that arent required

java -jar /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/trimmomatic-0.39.jar PE \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<mock_R1.fastq> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<mock_R2.fastq> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<qc_R1_paired.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<qc_R1_unpaired.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<qc_R2_paired.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<qc_R2_unpaired.fastq.gz> \
ILLUMINACLIP:/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:<seed mismatches>:<palindrome clip threshold>:<simple clip threshold> \
LEADING:<minimum quality required to keep a leading base> \
TRAILING:<minimum quality required to keep a trailing base> \
MAXINFO:<targetLength>:<strickness> \
SLIDINGWINDOW:<windowSize>:<requiredQuality> \
AVGQUAL:<minimum average quality for the whole read to pass> \
MINLEN:<minimum length of the sequence to be kept> \
