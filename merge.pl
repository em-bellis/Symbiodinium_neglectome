#!/usr/bin/perl

#use this script to print all lines of fastq on one file
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
	$counter++;
	if ($counter <4) {
		print OUTFILE1 $line."\t";
	} else {
		print OUTFILE1 $line."\n";
		$counter=0;
	}
}

close (OUTFILE1);
close (INFILE);
