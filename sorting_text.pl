#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub order_text {
    my ($handle) = @_;


    my @Chars;
    my @ordered;

    while (<$handle>) {
        push @Chars, [ split tr/\r\n//d ]; # split current line on newline and return
        @ordered = sort { length($a->[0]) <=> length($b->[0]) } @Chars;


    }


    for my $l (@ordered) {
        my @temp = "$l->[0]\n";
        print @temp;
    };



    return 1;
}

my $filename = "sample_input_q2.txt";
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
order_text($fh); # pass the handle around


exit 0;
