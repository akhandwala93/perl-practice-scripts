#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';



print "Enter file name:\n";
my $base_path = <STDIN>;chomp($base_path);
my $newpath = "./backup/$base_path";
my $directory = "backup";
my @Chars; #array temp used to store the file contents of randomFile.txt to copy to backup folder
my $lines=0;
#If the input file does not exists, create one.
if (!(-e $base_path )) {

    open(my $fh, '>', $base_path) or die "Could not open file '$base_path' $!";
    print $fh "perl is cool\n";
    close $fh;
    print "Wrote to $base_path\n";

}
#If the input file exists, check if there is a subdirectory named "backup".
elsif ((-e $base_path )) {
    #If subdirectory doesn't exists, make one.
    if (!(-d $directory)) {
        mkdir $directory;
        print "$base_path already exists. Checking backup directory... backup directory created\n";
    }

    else {
        print "$base_path already exists. Checking backup directory... already exists\n";

    }
    #If subdirectory exists, copy file to subdirectory using conditions below.
    if (-d $directory) {
        open(my $fh, '<:encoding(UTF-8)', $base_path)
            or die "Could not open file '$base_path' $!";
        while (<$fh>) {
            s/\n+//gm;
            $lines++;

        }
        #If file has more than 10 lines
        if ($lines > 10) {
            print "$base_path has more than 10 lines.\nWhat to do next?\nEnter ’c’ to backup the first 10 lines, ’o’ to overwrite without creating a backup\n";
            my $input = <STDIN>;
            while($input !~ m/^(c|o)$/i){
                print "Re-enter your choice: ";
                $input=<STDIN>;
            }
            chomp($input);
            if ($input =~ "c") {
                my $count = 0;
                open my $fh, '<:utf8', $base_path or die;
                while (<$fh>) {
                    s/\n+//gm;
                    push @Chars, $_;

                }
                close $fh;
                open(my $newHandler, '>', $newpath) or die "Could not open file '$newpath' $!";
                for (my $i=0; $i<10; $i++){
                    print $newHandler "$Chars[$i]\n";

                }
                close($newHandler);
                print "Ok, old file backed up under backup directory\n";
                $input = "o";

            }
            if ($input =~ "o") {
                open(my $fh, '>', $base_path) or die "Could not open file '$base_path' $!";
                print $fh "perl is cool\n";
                close $fh;

            }
            print "Wrote to file randomFile.txt\n";
        }
        #If file has less than 10 lines
        if ($lines <=10){
            print "$base_path has no more than 10 lines.\n";
            open my $fh, '<:utf8', $base_path or die;
            while (<$fh>) {
                s/\n+//gm;
                push @Chars, $_;

            }
            close $fh;
            open(my $newHandler, '>', $newpath) or die "Could not open file '$newpath' $!";
            for (my $i=0; $i<scalar(@Chars)-1; $i++){
                print $newHandler "$Chars[$i]\n";

            }
            close($newHandler);
            print "Ok, old file backed up under backup directory\n";
            open($fh, '>', $base_path) or die "Could not open file '$base_path' $!";
            print $fh "perl is cool\n";
            close $fh;
            print "Wrote to file $base_path\n";

        }
    }
}









