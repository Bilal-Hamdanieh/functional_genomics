##!/usr/bin/env bash
#This Script allows us to calculate the average depth of each read
cd /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data
# samtools depth sorted_bam.bam Uncomment to calculate at each read
samtools depth sorted_bam.bam | awk '{sum+=$3} END { print "Average = " ,sum/NR}'
