#!/usr/bin/perl

#use this script to parse apart interleaved merged fastq files from paired end sequencing into files of paired and single reads 	`

$infile = $ARGV[0];
print ("Input file is ", $infile, "\n");

$outfile1 = "pairs.txt";
print("Output file is ", $outfile1, "\n");

$outfile2 = "singles.txt";
print("Output file 2 is ", $outfile2, "\n");

#open the input and output files
open(INFILE, "<", $infile) || die ("Can't find the file $infile: $!");
open(OUTFILE1 , ">", $outfile1);
open(OUTFILE2, ">", $outfile2);

#read in file
while ($line = <INFILE>){
	$line=~ s/[\r]//g;
	chomp($line);
	$counter++;
	if (($counter==1) && ($line =~/(^\@DB775\S+)\s+[12]/)) {   ###may need to change this line to match seq id
		$FirstSeq=$1;
		$FirstLine = $line;
	} elsif (($counter==2) && ($line =~/(^\@DB775\S+)\s+[12]/)) {   ###may need to change this line to match seq id  
		$SecondSeq=$1;
		$SecondLine=$line;
	}

	if (($counter==2)&&($FirstSeq eq $SecondSeq)){
		print OUTFILE1 $FirstLine."\n".$SecondLine."\n";
		$counter=0;
	} elsif (($counter==2)&&($FirstSeq ne $SecondSeq)) {
		print OUTFILE2 $FirstLine."\n";
		$FirstLine = $line;
		if ($line =~/(^\@DB775\S+)\s+[12]/) {   ##may need to change this line to match seq id 
			$FirstSeq=$1;			
		}
		$counter=1; 
	}
}

if ($counter==1) {
	print OUTFILE2 $FirstLine."\n";
} 

close (OUTFILE1);
close (OUTFILE2);
close (INFILE);
