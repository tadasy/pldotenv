package Dotenv;
use 5.008001;
use strict;
use warnings;

use Carp;

our $VERSION = "0.01";


sub load {
    my $path = shift;
    my $file = shift;
    $file = '.env' unless defined $file;

#    print "${path}/${file}";
    open(DATAFILE, "< ${path}/${file}") or croak($!);

    while (my $line = <DATAFILE>){
        chomp($line);
        next if ($line =~ /^#/);
        $line =~ s/^export\s+//g;
        next unless ($line =~ /=/);
        my @data = split(/=/, $line);
        &setenv(@data);
    }
}

sub setenv {
    my $key = shift;
    $key =~ s/\A\s*(.*?)\s*\z/$1/;
    my $value = shift;
    $value =~ s/\A\s*(.*?)\s*\z/$1/;
    $ENV{$key} = $value;
}

1;
__END__

=encoding utf-8

=head1 NAME

Dotenv - It's new $module

=head1 SYNOPSIS

    use Dotenv;

=head1 DESCRIPTION

Dotenv is ...

=head1 LICENSE

Copyright (C) tadasy.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

tadasy E<lt>tadasy@gmail.comE<gt>

=cut

