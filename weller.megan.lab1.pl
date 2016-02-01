######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
#  Megan Weller			
#  mweller213@gmail.com		
#										
#########################################

# Replace the string value of the following variable with your names.
my $name = "Megan Weller";
my $partner = "Ashley Bertrand";
print "CSCI 305 Lab 1 submitted by $name and $partner.\n\n";

# Checks for the argument, fail if none given
if($#ARGV != 0) {
    print STDERR "You must specify the file name as the argument.\n";
    exit 4;
}

# Opens the file and assign it to handle INFILE
open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";


# YOUR VARIABLE DEFINITIONS HERE...

# This loops through each line of the file
while($line = <INFILE>) {

	# This prints each line. You will not want to keep this line.
	#print $line;

#Example:
#Carl Davis Alice in Wonderland: Act I: The Caucus Race


	# YOUR CODE BELOW...
	# Step 1, remove the extra strings before and between the song title
	my $s = $line =~ /\%([A-Z0-9]*)(\<[SEP]+\>)([A-Z0-9]*)(\<[SEP]+\>)(.*)(\<[SEP]+\>)(.*)/;
		print "\n";
		
		#my $d = $line =~ s/$1$2$3$4$5$6//g;
		my ($b) = ($7);
		$title = $b;
		
		print $title, "\n";
		
	#So far, all I'm doing is printing the song title, need to delete everything else because
	# it interferes with some steps below.	
		
		
	# Step 2 and 3, remove punctuation and symbols

	foreach("\n", $title){
		#this works! Gets rid of symbols	
		my $s1 = $title =~ s/([¿?¡!.&\$#@\%|])+//g;
		
		#Working and experimenting here, not sure how to get rid of everything between the (),etc.
		
		#my $s2 = $title =~ s/([\[\({\-_\+*;:`\\\/])+//g;
		my $s3 = $title =~ /(.*)(\([a-z0-9]+\))/;
		my ($a, $b) = ($1, $2);
	
		
		print $newTitle;
	}
	
}

# Close the file handle
close INFILE; 

# At this point (hopefully) you will have finished processing the song 
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";


# User control loop
#print "Enter a word [Enter 'q' to quit]: ";
#$input = <STDIN>;
#chomp($input);
#print "\n";	
#while ($input ne "q"){
	# Replace these lines with some useful code
#	print "Not yet implemented.  Goodbye.\n";
#	$input = 'q';
#}

# MORE OF YOUR CODE HERE....
