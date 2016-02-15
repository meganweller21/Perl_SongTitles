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
my $numValid = 0;
my $titles;
my %hash;
my @keys;
my @values;

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
	if ($title =~ /[^[:ascii:]]/ or $title =~ /~/) {
		$title = "";
	} else {
		$numValid = $numValid + 1;
	}

	# Step 5, convert to lowercase
	$title = lc $title;

	#making a titles array where each index is a title
	@titles[numValid] = $title;

	#splitting each title into words
	my @words = split ' ', $titles[numValid];

	my $i = 0;

	#use words - 1 so that the last word in a title is not included as a bigram with an empty string
	for($index=0; $index <= $#words - 1; $index++) {

		#array to hold keys
    	@keys[i] = $words[$index];

    	#array to hold values
    	@values[i] = $words[$index + 1];

    	#print("key: @keys[i], value: @values[i]\n");

    	#building hash of ((key, value), count)
    	for($j=0; $j <= $#keys; $j++) {
			for ($k = 0; $k < scalar @keys; $k++) {
   				$hash{$keys[$k]}{$values[$k]} += 1;
   			}
		}		

		$i = $i + 1;
	}

=pod
	#<=> makes it so keys are treated as numbers,
	#keys get sorted numerically
	foreach my $key(sort {$hash{$b}<=>$hash{$a}}keys %hash) {
		#printf "$key\t$hash{$key}\n";

		if(! %hash) {
			print("in first if statement");
	  		return "";
	 	}

	 	if($frequencyHash[0]>$frequencyHash[1]) {
	 		print("in second if statement: $words[0]");
	  		return $words[0];
	 	}

	  	else {

	  	}
	}
=cut
}

#print key : value = count
foreach my $key (sort keys %hash) {
   	while (my ($value, $count) = each %{$hash{$key}}) {
    	print "$key : $value = $count\n";
   	}
}

print("\nThere are $numValid valid lines.\n");

# Close the file handle
close INFILE; 

# At this point (hopefully) you will have finished processing the song 
# title file and have populated your data structure of bigram counts.
print "\nFile parsed. Bigram model built.\n\n";

#returns the word that most commonly follows the given argument
sub function() {
	$key = $_[0];
	if(exists($hash{$key})) {
		while (my ($value, $count) = each %{$hash{$key}}) {
			#doesn't work
   		}

	} else {
		return "$key does not exist";
	}
}

print &mcw("all");

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
