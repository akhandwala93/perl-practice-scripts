#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


my ($value, $from, $to, $rate, %rate);
%rate = (usd=>1, eur=>0.81, cad=>1.29, inr=>65.2, =>jpy=>105.75, vnd=>22750, krw=> 1079.43, btc=>0.000088);

print "Exchangeable currency: usd, eur, cad, inr, jpy, vnd, krw, btc\n";
print "Enter the current currency: ";
$from = <STDIN>;
while($from !~  /^(usd|eur|cad|inr|jpy|vnd|krw|btc)$/i){
    print "Re-enter current currency: ";
    $from=<STDIN>;
}


print "Enter the target currency: ";
$to= <STDIN>;
while($to !~ /^(usd|eur|cad|inr|jpy|vnd|krw|btc)$/i){
    print "Re-enter target currency: ";
    $to=<STDIN>;

}


print "Enter the amount of money: ";
$value= <STDIN>;


chomp ($from, $to, $value);
$rate = $rate{$to}/$rate{$from};
print "$value $from is ", $value*$rate, " $to \n";