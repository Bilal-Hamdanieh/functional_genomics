##!/usr/bin/env bash
#This Script is used to CROP or HEADCROP FASTQ Files.
#Replace the <option> and comment the unwanted section
java -jar /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<file_name.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/cropped_<file_name.fastq.gz> \
HEADCROP:<number of base pairs to remove from the end>

java -jar /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<file_name.fastq.gz> \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/<cropped_file_name.fastq.gz> \
CROP:<number of base pairs to keep starting first bp>
