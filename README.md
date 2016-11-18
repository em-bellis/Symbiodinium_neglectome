# Symbiodinium_neglectomes

This repository contains scripts used to assemble Symbiodinium chloroplast and mitochondrial DNA from cnidarian genome skimming data.  The general pipeline for this analysis is as follows:

1. Quality filter reads with tool from Hannon-lab FASTX-toolkit:
  ```fastq_quality_filter -Q 33 -q 20 -p 80 -i infile.fastq -o outfile.fastq```
  
2. Resort filtered reads into forward, reverse, and singles using `sort_pairs2.sh` (dependencies are `unmerge.pl, merge.pl,Sep_FandR.pl, Sep_Pairs2.pl`)

3. Map to reference.  Shell scripts `aln1.sh` and `aln2.sh` are included for this purpose.  Prior to alignment with `bwa` need to index reference: ```bwa index -a is reference.fastq```
