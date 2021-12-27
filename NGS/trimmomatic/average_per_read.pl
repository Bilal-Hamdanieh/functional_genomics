#!/usr/bin/env perl
#use warnings;
#use strict;
#Read the Argument to Open the File
my $trimmed_reads;
if ($ARGV[0]) {
  $trimmed_reads = $ARGV[0];
}
else{
  print "Enter the Trimmed FASTQC file you want to Process: " ;
  $trimmed_reads = <STDIN>;
  chomp $trimmed_reads;
}
my $length;
if ($ARGV[1]){
  $length = $ARGV[1];
}
else{
  print "Enter the Length of the Reads you want to Process: ";
  $length = <STDIN>;
  chomp $length;
}

#Read Fle Containing the Trimmed Reads
open (READS, '<', "$trimmed_reads") or die "The Given FastQC file Doesn't Exist.";

#Read through the File line by line:
my $reads_index= 0;
my @reads = ();
my $scores_index= 0;
my @scores = ();
my $size;
my $sum;
my $allow_score_calculation = 0;
# Initialize a boolean is_score to indicate when the next line is a score
my $is_score;
while(<READS>){
  # if the line starts with @HWI => Unique Instrument Name
  # => Indicates the Beginning of a new Read => Skip
  if($_=~/^@[H][W][I]/){
    $is_score= 0;
  }
  # if the line starts with a + => The next line is a score
  elsif($_=~/^\+\s/){
    #print("is +\n");
    #print("check: $_\n");
    $is_score = 1;
  }
  # else the line is either a sequence or a score
  else{
    # if the line exists before encountering + => its a sequence
    if($is_score==0){
      # if the sequence if of the specified length we add it to the reads
      $size = length $_ ;
      $size--;
      if ($size == $length){
        @reads[$reads_index]=$_;
        $reads_index++;
        #only allow score calculation if a sequence was previously added
        $allow_score_calculation = 1;
      }
    }
    # else the line exists after encountering + => its a score
    else{
      if($allow_score_calculation == 1){
        $sum = 0;
        my @line = split('',$_);
        foreach my $sc (@line) {
              my $ascii = ord($sc);
              #print "$ascii\t";
              $sum = $sum + $ascii;
          }
        my $avg_score = $sum / $length;
        @scores[$scores_index]=$avg_score;
        #print "$avg_score\n";
        #print "$scores[1]\n";
        $scores_index++;
        #reset allow score calc boolean
        $allow_score_calculation = 0;
      }
    }
  }
}
my $total = $reads_index;
#print the outputs:
print ("Total Number of Reads with Length $length is: $total \n");
#print ("Total Number of Scores is: $scores_index\n");
#Output to a file the Log:
my $target;
print "Enter the File name you want to output to: " ;
$target = <STDIN>;
chomp $target;
unless(open FILE, '>'.$target) {
    # Die with error message
    # if we can't open it.
    die "\nUnable to create $target\n";
}
close(FILE);

#Open file to append the results
open (FW, '>>', $target) or die "File Not found.";
for (my $r=0; $r<$total; $r++){
  print FW ("$reads[$r]+\nAverage Score: $scores[$r]\n@@@@@@@@@@@@@@\n");
  #print ("$reads[$r]+\nAverage Score: $scores[$r]\n@@@@@@@@@@@@@@\n");
}
close(FW);
