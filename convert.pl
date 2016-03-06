#!/usr/bin/perl

use strict;
use warnings;

my($qwerty2dvorak, $dvorak2qwerty) = init_map();
# $qwerty2dvorak; # 48 -> 45
# $dvorak2qwerty; # 45 -> 48

if( @ARGV && $ARGV[0] eq 'qwerty2dvorak' ) {
    while( <STDIN> ) {
        if( /^(key_.*:)(\d+)$/ && exists($qwerty2dvorak->{$2}) ) {
            print "$1$qwerty2dvorak->{$2}\n";
        } else {
            print $_;
        }
    }
} elsif( @ARGV && $ARGV[0] eq 'dvorak2qwerty' ) {
        if( /^(key_.*:)(\d+)$/ && exists($dvorak2qwerty->{$2}) ) {
            print "$1$dvorak2qwerty->{$2}\n";
        } else {
            print $_;
        }
} else {
    print "usage: perl convert.pl qwerty2dvorak|dvorak2qwerty < options.txt > out-options.txt\n";
    exit 1;
}

sub init_map {
    no warnings 'qw';
#    my $qwerty = q(-=qwertyuiop[]asdfghjkl;'zxcvbnm,./_+QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?);
#    my $dvorak = q([]',.pyfgcrl/=aoeuidhtns-;qjkxbmwvz{}"<>PYFGCRL?+AOEUIDHTNS_:QJKXBMWVZ);
    my $qwerty = q(-=qwertyuiop[]asdfghjkl;'zxcvbnm,./);
    my $dvorak = q([]',.pyfgcrl/=aoeuidhtns-;qjkxbmwvz);
    my %minecraft = qw(
    2  1
    3  2
    4  3
    5  4
    6  5
    7  6
    8  7
    9  8
    10  9
    11  0
    12  -
    13  =
    16  q
    17  w
    18  e
    19  r
    20  t
    21  y
    22  u
    23  i
    24  o
    25  p
    26  [
    27  ]
    30  a
    31  s
    32  d
    33  f
    34  g
    35  h
    36  j
    37  k
    38  l
    39  ;
    40  '
    41  `
    43  \
    44  z
    45  x
    46  c
    47  v
    48  b
    49  n
    50  m
    51  ,
    52  .
    53  /
    144  ^
    145  @
    146  :
    147  _
    );

    my %minecraft_inv;
    while( my($code, $key) = each %minecraft ) {
        $minecraft_inv{$key} = $code;
    }

    my(%qwerty2dvorak, %dvorak2qwerty);
    for my $i (0 .. length($qwerty)-1) {
        my $qkey = substr($qwerty, $i, 1);
        my $dkey = substr($dvorak, $i, 1);
        #print "$qkey $dkey\n";
        my $qcode = $minecraft_inv{$qkey};
        my $dcode = $minecraft_inv{$dkey};
        $qwerty2dvorak{$qcode} = $dcode;
        $dvorak2qwerty{$dcode} = $qcode;
    }
    return (\%qwerty2dvorak, \%dvorak2qwerty);
}
