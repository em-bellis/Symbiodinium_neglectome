# Symbiodinium_neglectomes

This repository contains scripts for assembling Symbiodinium chloroplast and mitochondrial DNA from cnidarian genome skimming data.  A general pipeline for this analysis is as follows:

1. Quality filter reads with tool from Hannon lab FASTX-toolkit:
  ```fastq_quality_filter -Q 33 -q 20 -p 80 -i infile.fastq -o outfile.fastq```
  
2. Re-sort filtered reads into forward, reverse, and singles using `sort_pairs2.sh` (dependencies are `unmerge.pl, merge.pl,Sep_FandR.pl, Sep_Pairs2.pl`).  Exercise caution when using these scripts -- they were originally created for analysis of one particular dataset and have not yet been generalized or extensively tested on other datasets.

3. Map to reference.  

  Shell scripts `aln1.sh` and `aln2.sh` are included for this purpose.  Prior to alignment with `bwa` need to index reference: ```bwa index -a is reference.fastq```. Then map to reference with `bwa aln` (`aln1.sh`) and `bwa sampe/se` (`aln2.sh`).  Check # of mapped reads with `samtools flagstat`.

4. Extract unmapped reads: `samtools view -bf 4 aln.pe.sam >pe.unmap.bam`.  Mapped reads can be extracted with `-bF 4` instead of `-bf 4`.

5. Convert unmapped reads from bam file to fastq with `bedtools bamToFastq`.
