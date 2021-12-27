##!/usr/bin/env bash
# Extracts the total number of Mutations selected
# I: Insertions
# D: deletions
# N: Skipped region
# S: Soft clipped
# H: Hard clipped
# P: padding
# =: sequence match
# X: sequence mismatch
samtools view sorted_bam.bam | cut -f 6 | grep -o '[0-9]*I' | grep -o '[0-9]' | awk '{ SUM += $1 } END { print SUM }'
