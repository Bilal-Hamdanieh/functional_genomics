##!/usr/bin/env bash
cd /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data
samtools view -Sb sample.sam > sample.bam
#Validate BAM File
java -jar ~/picard/build/libs/picard.jar ValidateSamFile \
      -INPUT sample.bam\
      -MODE SUMMARY
#Sort the BAM file by genomic coordinates
java -jar ~/picard/build/libs/picard.jar SortSam \
      -INPUT sample.bam \
      -OUTPUT sorted_bam_file.bam \
      -SORT_ORDER coordinate

#Mark Duplicates
java -jar ~/picard/build/libs/picard.jar MarkDuplicates \
      -INPUT sorted_bam_file.bam \
      -OUTPUT marked_duplicates.bam \
      -METRICS_FILE marked_dup_metrics.metrics
