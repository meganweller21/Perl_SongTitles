######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
#  Megan Weller			
#  mweller213@gmail.com		
#  Ashley Bertrand								
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

	# YOUR CODE BELOW...
	# Step 1, remove the extra strings before and between the song title
	#delete every unneeded part of the string
	$line =~ s/\%([A-Z0-9]*)(\<[SEP]+\>)([A-Z0-9]*)(\<[SEP]+\>)(.*)(\<[SEP]+\>)//g;
		
	#rename line to title
	$title = $line;
	
	# Step 2 and 3, remove punctuation and symbols

	#Gets rid of symbols	
	$title =~ s/([¿?¡!.&\$#@\%|])+//g;

	#( { \ / -: "‘+=*feat.
	$title =~ s/(\/(.*))+//g;
	$title =~ s/(\\(.*))+//g;
	$title =~ s/(\-(.*))+//g;
	$title =~ s/(_(.*))+//g;
	$title =~ s/(\:(.*))+//g;
	$title =~ s/(\"(.*))+//g;
	$title =~ s/(\`(.*))+//g;
	$title =~ s/(\+(.*))+//g;
	$title =~ s/(\=(.*))+//g;
	$title =~ s/(\*(.*))+//g;
	$title =~ s/(feat.)+//g;
	$title =~ s/(\((.*)\))+//g;
	$title =~ s/(\()+//g;
	$title =~ s/(\[(.*)\])+//g;
	$title =~ s/(\[)+//g;
	$title =~ s/(\{(.*)\})+//g;

	# Step 5, convert to lowercase
	$newTitle = lc $title;

	# Step 4
	foreach($title){
		print $newTitle unless /[^[:ascii:]]/;
	}

	#Split title into individual words
	#Each word is an element of @array
	my @array = split(' ', $newTitle);
	print("$_\n") for (@array);
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
