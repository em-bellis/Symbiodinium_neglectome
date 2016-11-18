#!/bin/tcsh

#aln to reference w/ bwa

bwa aln -t 4 -n 10 -k 5 reference.fasta R1.fastq.gz > aln.R1.sai
bwa aln -t 4 -n 10 -k 5 reference.fasta R2.fastq.gz > aln.R2.sai
bwa aln -t 4 -n 10 -k 5 ref/sym_markers_oneline.fasta $1/singles_unmap.fastq.gz >$1/aln.se.sai


##-n is max # differences allowed, -k is max #differences in the seed.  These are fairly loosey-goosey params.
