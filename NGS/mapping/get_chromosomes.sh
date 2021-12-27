##!/usr/bin/env bash
#This Script is used to download the chromosomes. Probably will not be used for the exam. Reference Genome will be given.
#Notice: Edit the <options> before running the script
cd /home/ubuntu/Desktop/Genomics_and_Data_Mining/R_Workplace/NGS_Exam_Data/Chromosomes
wget http://hgdownload.cse.ucsc.edu/goldenPath/<hg38/bigZips/hg38.chromFa.tar.gz>
tar zvfx hg38.chromFa.tar.gz
cat ./chroms/*.fa > <hg38.fa>
rm -r chroms/
