#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

print "What string do you want to search for?\n";
my $string= <STDIN>;
chomp ($string);
my @files = glob("*.*");

foreach my $file (@files) {
    open my $fh, '<:utf8', $file || die;
    while (my $line = <$fh>) {
    if ($line =~ /\b($string)\b/) {

        if (-e $file && -r $file && -w $file && -T $file && -x $file){
           print  "Found $string in $file....erwTx\n";
        }
        elsif (-e $file && -r $file && -w $file && -T $file){
            print  "Found $string in $file....erwT\n";
        }
        elsif (-e $file && -r $file && -w $file ){
            print  "Found $string in $file....erw\n";
        }
        elsif (-e $file && -r $file ){
            print  "Found $string in $file....er\n";
        }
        elsif (-e $file){
            print  "Found $string in $file....e\n";
        }
        else {
            print "file doesn't exist";
        }

        last;
        }

    }

}










