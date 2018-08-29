#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Text::Wrap qw(wrap);

sub fit_text {
    my ($handle, $max_width) = @_;
    my @Chars;


    while (<$handle>) {
        push @Chars, [ split tr/\r\n// ]; # \r\n line sep on windows :


    }


    for my $l (@Chars) {
        my $text = $l->[0];
        $text =~s/ +/ /;
        $Text::Wrap::columns = $max_width;
        print wrap('', '', $text);


    };

    return 1;
}
my $filename = 'sample_input_q2.txt';
my $max = 16;
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
fit_text($fh, $max);

exit 0;






