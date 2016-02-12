######################################### 	
#    CSCI 305 - Programming Lab #1		
#										
#  Megan Weller			
#  mweller213@gmail.com		
#  Ashley Bertrand								
#########################################

#use strict;
#use warnings;

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
my $numValid = 0;

# This loops through each line of the file
while($line = <INFILE>) {

	# Step 1, remove the extra strings before and between the song title
	#delete every unneeded part of the string
	$line =~ s/\%([A-Z0-9]*)(\<[SEP]+\>)([A-Z0-9]*)(\<[SEP]+\>)(.*)(\<[SEP]+\>)//g;

	#rename line to title
	$title = $line;
	
	# Setp 2, eliminate all text following these symbols
	$title =~ s/(\[(.*))+//g;			#[
	$title =~ s/(\((.*))+//g;			#(
	$title =~ s/(\{(.*))+//g;			#{
	$title =~ s/(\\(.*))+//g;			#\
	$title =~ s/(\/(.*))+//g;			#/
	$title =~ s/(\_(.*))+//g;			#_
	$title =~ s/(\-(.*))+//g;			#-
	$title =~ s/(\:(.*))+//g;			#:
	$title =~ s/(\"(.*))+//g;			#"
	$title =~ s/(\`(.*))+//g;			#`
	$title =~ s/(\+(.*))+//g;			#+
	$title =~ s/(\=(.*))+//g;			#=
	$title =~ s/(\*(.*))+//g;			#*
	$title =~ s/(feat.(.*))+//g;		#feat.	

	# Step 3, eliminate punctuation
	$title =~ s/([?¿!¡.;&\$@\%#|])+//g;

	# Step 4, filter out non-English characters
	if ($title =~ /[^[:ascii:]]/) {
		#print("invalid: $title\n");
		$title = "";
	} else {
		#print("valid: $title\n");
		$numValid = $numValid + 1;
	}

	# Step 5, convert to lowercase
	$title = lc $title;

	#Split title into individual words
	#Each word is an element of @words
	my @words = split(' ', $title);
	#print("$_\n") for (@words);

	#scalar: $ - number, string, reference
	#array: @ - list of scalars
	#hash: % - sets of key/value pairs

	#putting each word into a indices of a hash
	my %currentHash = @words;

	my $currentHash = %currentHash[$i];
	my $a;
	my $b;

#=pod
	#<=> makes it so keys are treated as numbers,
	#keys get sorted numerically
	foreach my $nextWord(sort {$currentHash{$b}<=>$currentHash{$a}}keys %currentHash) {
		#print("nextWord: $nextWord\n");
		#print("currentHash: $currentHash{$b}\n");

		if(! %currentHash) {
			print("in first if statement");
	  		return "";
	 	}

	 	if($frequencies[0]>$frequencies[1]) {
	 		print("in second if statement: $words[0]");
	  		return $words[0];
	 	}

	  	else {
	  		#print("else\n");
	  	}
	}
#=cut

	
}

print("\n\nThere are $numValid valid lines.\n");

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
