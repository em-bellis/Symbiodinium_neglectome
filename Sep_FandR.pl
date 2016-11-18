#!/usr/bin/perl

#use this script to parse apart interleaved merged fastq files into forward and reverse reads 	`

$infile = $ARGV[0];
print ("Input file is ", $infile, "\n");

$outfile1 = "singles.R1.txt";
print("Output file is ", $outfile1, "\n");

$outfile2 = "singles.R2.txt";
print("Output file 2 is ", $outfile2, "\n");

#open the input and output files
open(INFILE, "<", $infile) || die ("Can't find the file $infile: $!");
open(OUTFILE1 , ">", $outfile1);
open(OUTFILE2, ">", $outfile2);

#read in file
while ($line = <INFILE>){
	$line=~ s/[\r]//g;
	chomp($line);
	if ($line =~/(^\@.*\:[0-9]+)\s+1/) {  #######may need to change this line to match seq identifier!!!
		print OUTFILE1 $line."\n";
	} elsif ($line =~/(^\@.*\:[0-9]+)\s+2/) {  #######may need to change this line to match seq identifier!!!
		print OUTFILE2 $line."\n";
	}
}

close (OUTFILE1);
close (OUTFILE2);
close (INFILE);
