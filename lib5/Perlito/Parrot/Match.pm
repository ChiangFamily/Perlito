# Do not edit this file - Generated by Perlito 7.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito::Perl5::Runtime;
use Perlito::Perl5::Prelude;
our $MATCH = Perlito::Match->new();
{
package GLOBAL;
    sub new { shift; bless { @_ }, "GLOBAL" }
    
    # use v6 
;
    {
    package Perlito::Perl5::Match;
        sub new { shift; bless { @_ }, "Perlito::Perl5::Match" }
        sub str { $_[0]->{str} };
sub array { $_[0]->{array} };
sub hash { $_[0]->{hash} };
sub result_object { $_[0]->{result_object} };
sub from { $_[0]->{from} };
sub to { $_[0]->{to} };
sub bool { $_[0]->{bool} };
        sub scalar {
            my $self = $_[0];
            if (Main::bool($self->{bool})) {
                    return scalar (undef())
            }
;
            if (Main::bool(defined($self->{result_object}))) {
                    return scalar ($self->{result_object})
            }
;
            return scalar (substr($self->{str}, $self->{from}, ((($self->{to} - $self->{from})) + 1)))
        };
        sub __get_bool {
            my $self = $_[0];
            return scalar ($self->{bool})
        };
        sub __get_int {
            my $self = $_[0];
            return scalar ((0 + $self->scalar()))
        };
        sub __get_number {
            my $self = $_[0];
            return scalar ((0 + $self->scalar()))
        };
        sub __get_string {
            my $self = $_[0];
            return scalar ($self->scalar())
        }
    }


}

1;
