##!/usr/bin/env bash
#Get the number of reads with min length = $1 argument
java -jar /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE \
-threads 8 \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Data/sample.fastq \
/home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/proccessed.fastq \
MINLEN:$1 

echo -e "Number of reads of length 101 is : $(($(wc -l /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/proccessed.fastq\
|cut -d " " -f1)/4))"
