#!/bin/bash

cat R1.hq.fastq R2.hq.fastq > cat.fastq

merge.pl cat.fastq merged.txt
sort merged.txt -k1,1d -k2,2n >sort.txt
rm -rf merged.txt

Sep_Pairs2.pl sort.txt
Sep_FandR.pl pairs.txt

unmerge.pl singles.R1.txt R1_hq.fastq
unmerge.pl singles.R2.txt R2_hq.fastq
unmerge.pl singles.txt singles.fastq

rm -rf pairs.txt
rm -rf singles.txt
rm -rf singles.R1.txt
rm -rf singles.R2.txt
rm -rf sort.txt
rm -rf cat.fastq
