##!/usr/bin/env bash
#This Script can be used to filter out bad tiles manually, below is an example only, edit the range + ID
grep -P -A 4 '@HWI-D00119:50:H7AP8ADXX:1:(?!1[1-2][0-9][0-9])' sample.fastq
