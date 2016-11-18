#!/usr/bin/perl

#use this script to print all lines of fastq on one line back onto 4 lines

$infile = $ARGV[0];
print ("Input file is ", $infile, "\n");

$outfile1 = $ARGV[1];
print("Output file is ", $outfile1, "\n");

#open the input and output files
open(INFILE, "<", $infile) || die ("Can't find the file $infile: $!");
open(OUTFILE1 , ">", $outfile1);

#read in file
while ($line = <INFILE>){
	$line=~ s/[\r]//g;
	chomp($line);
	@lineParts = split(/\t/, $line);
	print OUTFILE1 $lineParts[0]."\n".$lineParts[1]."\n".$lineParts[2]."\n".$lineParts[3]."\n";
}

close (OUTFILE1);
close (INFILE);
