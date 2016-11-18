#!/bin/tcsh

bwa sampe reference.fasta aln.R1.sai aln.R2.sai R1.fastq.gz R2.fastq.gz > aln.pe.sam
bwa samse reference.fasta aln.se.sai singles.fastq.gz > aln.se.sam

samtools view -bhSo aln.pe.bam aln.pe.sam
#rm -rf aln.pe.sam
#rm -rf aln.R1.sai
#rm -rf aln.R2.sai
samtools sort aln.pe.bam -o aln.pe.sort
#rm -rf aln.pe.bam

#rm -rf aln.se.sai
samtools view -bhSo aln.se.bam aln.se.sam
#rm -rf aln.se.sam
samtools sort aln.se.bam -o aln.se.sort
#rm -rf aln.se.bam

samtools merge -O BAM merged.bam aln.pe.sort.bam aln.se.sort.bam
#rm -rf sym.sam
#rm -rf sym.bam
