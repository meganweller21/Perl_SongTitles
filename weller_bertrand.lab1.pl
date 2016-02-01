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
		#each part of the string
		my $s = $line =~ /\%([A-Z0-9]*)(\<[SEP]+\>)([A-Z0-9]*)(\<[SEP]+\>)(.*)(\<[SEP]+\>)(.*)/;
		print "\n";
		
		#delete every unneeded part of the string
		$line =~ s/\%$1$2$3$4$5$6//g;
		#rename line to title
		$title = $line;
		print $title, "\n";
	
	# Step 2 and 3, remove punctuation and symbols

	foreach("\n", $title){
		#this works! Gets rid of symbols	
		$title =~ s/([¿?¡!.&\$#@\%|])+//g;
		
		#Working and experimenting here, not sure how to get rid of everything between the (),etc.
		#$title =~ s/([\[\({\-_\+*;:`\\\/])+//;
		
		#testing with this, it will delete the / but nothing after
		#Not sure why it's printing so much!
		$title =~ s/(\/(^*))+//g;
		
		$newTitle = $title;
		
		print $newTitle;
	}





	# Step 4

	# Step 5, convert to lowercase
	$lowerCase = lc $title;
	print $lowerCase;
	
	
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
