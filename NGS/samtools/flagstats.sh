##!/usr/bin/env bash
#This script allows us to get the flagstat
samtools flagstat sorted_bam.bam > flagstats.txt
#We use awk-sed combination to retrieve the desired total bit
# Format:
# 0x2 maybe
# QC-passed reads Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '1q;d'

# To get NOT of any criteria, add the print $ by 2
# 0x200
# QC-NOT passing reads Code: cat flagstats.txt | awk -F " " '{print $3}' | sed '1q;d'

# 0x100
# Secondary Reads Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '2q;d'

# 0x800
# Supplmentary Reads Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '3q;d'

# 0x400
# Duplicate Reads Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '4q;d'

# Number of Mapped Reads Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '5q;d'

# Mapped Reads % Code: cat flagstats.txt | awk -F "[(|%]" 'NR == 5 {print $2"%"}'

# Number of paired in sequencing Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '6q;d'

# Number of read 1 Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '7q;d'

# Number of read 2 Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '8q;d'

# 0x64 0x20 0x2 0x1 and 0x128 0x20 0x2 0x1  OR  0x64 0x10 0x2 0x1 and 0x128 0x20 0x2 0x1 for each read of the pair
# Number of Properly Paired Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '9q;d'

# Properly Paird % Code: cat flagstats.txt | awk -F "[(|%]" 'NR == 9 {print $2"%"}'

# Number of sequences mapped with itself and mate Code:  cat flagstats.txt | awk -F " " '{print $1}' | sed '10q;d'

# Number of Singeltons Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '11q;d'

# Singeltons % Code: cat flagstats.txt | awk -F "[(|%]" 'NR == 11 {print $2"%"}'

# Seq mapped to a different Chromosome than Mate Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '12q;d'

# Seq mapped to a different Chromosome mapQ>=5 Code: cat flagstats.txt | awk -F " " '{print $1}' | sed '13q;d'
