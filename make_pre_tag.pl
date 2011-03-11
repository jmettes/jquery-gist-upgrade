#!/usr/bin/env perl

use strict;
use warnings;

use LWP::Simple qw(get);
use HTML::Entities qw(encode_entities);

my $gist = shift or die "No gist ID specified";
my $file = shift;

my $url = "http://gist.github.com/";
my $id = "fake-gist-$gist";

if ($file) {
    $url .= "raw/$gist/$file";
    $id .= "-$file";
} else {
    $url .= "$gist.txt";
}

my $raw = get($url);
my $escaped = encode_entities($raw);

print <<HTML;
<pre id="$id" class="fake-gist">$escaped</pre>
HTML
