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
        {
    package Perlito::Test;
        sub new { shift; bless { @_ }, "Perlito::Test" }
        (my  $num_of_tests_run = undef);
(my  $num_of_tests_failed = undef);
(my  $num_of_tests_badpass = undef);
(my  $num_of_tests_planned = undef);
(my  $testing_started = undef);
        sub plan {
            my $number_of_tests = $_[0];
            ($testing_started = 1);
            ($num_of_tests_planned = $number_of_tests);
            Main::say('1..' . $number_of_tests)
        };
        sub ok {
            my $cond = $_[0];
            my $desc = $_[1];
            my $todo = $_[2];
            my $depends = $_[3];
            Perlito::Test::proclaim($cond, 'ok! ' . $desc, $todo, $depends)
        };
        sub is {
            my $got = $_[0];
            my $expected = $_[1];
            my $desc = $_[2];
            my $todo = $_[3];
            my $depends = $_[4];
            ((my  $test = undef) = ($got eq $expected));
            Perlito::Test::proclaim($test, 'is! ' . $desc, $todo, $got, $expected, $depends)
        };
        sub is_deeply {
            my $got = $_[0];
            my $expected = $_[1];
            my $desc = $_[2];
            my $todo = $_[3];
            my $depends = $_[4];
            ((my  $got_perl = undef) = Main::perl($got, ));
            ((my  $expected_perl = undef) = Main::perl($expected, ));
            ((my  $test = undef) = (($got_perl eq $expected_perl)));
            Perlito::Test::proclaim($test, 'is deeply! ' . $desc, $todo, $got_perl, $expected_perl, $depends)
        };
        sub isnt {
            my $got = $_[0];
            my $expected = $_[1];
            my $desc = $_[2];
            my $todo = $_[3];
            my $depends = $_[4];
            ((my  $test = undef) = !Main::bool((($got eq $expected))));
            Perlito::Test::proclaim($test, 'isnt! ' . $desc, $todo, $got, $expected, $depends, do {
(my  $Hash_a = {});
    ($Hash_a->{'negate'} = 1);
    $Hash_a
})
        };
        sub cmp_ok {
            my $got = $_[0];
            my $Code_compare_func = $_[1];
            my $expected = $_[2];
            my $desc = $_[3];
            my $todo = $_[4];
            my $depends = $_[5];
            Main::say('### Perlito::Test::cmp_ok not implemented')
        };
        sub like {
            Main::say('### Perlito::Test::like not implemented')
        };
        sub unlike {
            Main::say('### Perlito::Test::unlike not implemented')
        };
        sub eval_dies_ok {
            Main::say('### Perlito::Test::eval_dies_ok not implemented')
        };
        sub isa_ok {
            Main::say('### Perlito::Test::isa_ok not implemented')
        };
        sub use_ok {
            Main::say('### Perlito::Test::use_ok not implemented')
        };
        sub throws_ok {
            Main::say('### Perlito::Test::throws_ok not implemented')
        };
        sub dies_ok {
            Main::say('### Perlito::Test::dies_ok not implemented')
        };
        sub lives_ok {
            Main::say('### Perlito::Test::lives_ok not implemented')
        };
        sub skip {
            my $reason = $_[0];
            my $depends = $_[1];
            Perlito::Test::proclaim(1, '', 'skip ' . $reason, $depends)
        };
        sub pass {
            my $desc = $_[0];
            Perlito::Test::proclaim(1, 'pass! ' . $desc)
        };
        sub flunk {
            my $desc = $_[0];
            my $todo = $_[1];
            my $depends = $_[2];
            Perlito::Test::proclaim(0, 'flunk! ' . $desc, $todo, $depends)
        };
        sub proclaim {
            my $cond = $_[0];
            my $desc = $_[1];
            my $todo = $_[2];
            my $got = $_[3];
            my $expected = $_[4];
            my $depends = $_[5];
            my $negate = $_[6];
            ($testing_started = 1);
            ($num_of_tests_run = ($num_of_tests_run + 1));
            if (Main::bool(($cond))) {
                    Main::say('ok ', $num_of_tests_run)
            }
            else {
                    Main::say('not ok ', $num_of_tests_run);
                    Perlito::Test::report_failure($todo, $got, $expected, $negate)
            }
;
            return scalar ($cond)
        };
        sub report_failure {
            my $todo = $_[0];
            my $got = $_[1];
            my $expected = $_[2];
            my $negate = $_[3];
            Main::say('### Perlito::Test::report_failure not implemented')
        };
        sub test_ends {
            if (Main::bool((!Main::bool($testing_started)))) {
                    return ()
            }
;
            if (Main::bool((!Main::bool($num_of_tests_planned)))) {
                    Main::say('1..' . $num_of_tests_run)
            }
;
            if (Main::bool((($num_of_tests_planned != $num_of_tests_run)))) {
                    Main::say('# Looks like you planned ' . $num_of_tests_planned . ' tests, but ran ' . $num_of_tests_run)
            }
;
            if (Main::bool(($num_of_tests_failed))) {
                    Main::say('# Looks like you failed ' . $num_of_tests_failed . ' tests of ' . $num_of_tests_run)
            }
;
            ($num_of_tests_run = 0);
            ($num_of_tests_failed = 0);
            ($num_of_tests_planned = 0);
            ($testing_started = 0)
        }
    }


}

1;
