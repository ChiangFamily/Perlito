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
package Rul;
sub new { shift; bless { @_ }, "Rul" }
sub constant { my $str = $_[0]; ((my  $len = undef) = Main::chars($str, )); if (Main::bool(($str eq '\\'))) { ($str = '\\\\') } ; if (Main::bool(($str eq '\''))) { ($str = '\\\'') } ; if (Main::bool(($len))) { '( \'' . $str . '\' eq substr( $str, $MATCH.to, ' . $len . ') ' . '&& ( $MATCH.to = ' . $len . ' + $MATCH.to )' . ')' } else { return scalar ('1') } }
}

;
{
package Rul::Quantifier;
sub new { shift; bless { @_ }, "Rul::Quantifier" }
sub term { $_[0]->{term} };
sub quant { $_[0]->{quant} };
sub greedy { $_[0]->{greedy} };
sub ws1 { $_[0]->{ws1} };
sub ws2 { $_[0]->{ws2} };
sub ws3 { $_[0]->{ws3} };
sub emit_perl6 { my $self = $_[0]; if (Main::bool(((($self->{quant} eq '')) && (($self->{greedy} eq ''))))) { return scalar ($self->{term}->emit_perl6()) } ; if (Main::bool(((($self->{quant} eq '+')) && (($self->{greedy} eq ''))))) { $self->{term}->set_captures_to_array(); return scalar ('(do { ' . 'my $last_match_null = 0; ' . 'my $last_pos = $MATCH.to; ' . 'my $count = 0; ' . 'while ' . $self->{term}->emit_perl6() . ' && ($last_match_null < 2) ' . '{ ' . 'if $last_pos == $MATCH.to() { ' . '$last_match_null = $last_match_null + 1; ' . '} ' . 'else { ' . '$last_match_null = 0; ' . '}; ' . '$last_pos = $MATCH.to; ' . '$count = $count + 1; ' . '}; ' . '$MATCH.to = $last_pos; ' . '$count > 0; ' . '})') } ; if (Main::bool(((($self->{quant} eq '*')) && (($self->{greedy} eq ''))))) { $self->{term}->set_captures_to_array(); return scalar ('(do { ' . 'my $last_match_null = 0; ' . 'my $last_pos = $MATCH.to; ' . 'while ' . $self->{term}->emit_perl6() . ' && ($last_match_null < 2) ' . '{ ' . 'if $last_pos == $MATCH.to() { ' . '$last_match_null = $last_match_null + 1; ' . '} ' . 'else { ' . '$last_match_null = 0; ' . '}; ' . '$last_pos = $MATCH.to; ' . '}; ' . '$MATCH.to = $last_pos; ' . '1 ' . '})') } ; if (Main::bool(((($self->{quant} eq '?')) && (($self->{greedy} eq ''))))) { $self->{term}->set_captures_to_array(); return scalar ('(do { ' . 'my $last_pos = $MATCH.to; ' . 'if !(do {' . $self->{term}->emit_perl6() . '}) ' . '{ ' . '$MATCH.to = $last_pos; ' . '}; ' . '1 ' . '})') } ; warn('Rul::Quantifier: ' . Main::perl($self, ("" . ' not implemented'))); $self->{term}->emit_perl6() };
sub set_captures_to_array { my $self = $_[0]; $self->{term}->set_captures_to_array() }
}

;
{
package Rul::Or;
sub new { shift; bless { @_ }, "Rul::Or" }
sub or_list { $_[0]->{or_list} };
sub emit_perl6 { my $self = $_[0]; '(do { ' . 'my $pos1 = $MATCH.to; (do { ' . Main::join(([ map { $_->emit_perl6() } @{( $self->{or_list} )} ]), '}) || (do { $MATCH.to = $pos1; ') . '}) })' };
sub set_captures_to_array { my $self = $_[0]; [ map { $_->set_captures_to_array() } @{( $self->{or_list} )} ] }
}

;
{
package Rul::Concat;
sub new { shift; bless { @_ }, "Rul::Concat" }
sub concat { $_[0]->{concat} };
sub emit_perl6 { my $self = $_[0]; '(' . Main::join(([ map { $_->emit_perl6() } @{( $self->{concat} )} ]), ' && ') . ')' };
sub set_captures_to_array { my $self = $_[0]; [ map { $_->set_captures_to_array() } @{( $self->{concat} )} ] }
}

;
{
package Rul::Subrule;
sub new { shift; bless { @_ }, "Rul::Subrule" }
sub metasyntax { $_[0]->{metasyntax} };
sub captures { $_[0]->{captures} };
sub emit_perl6 { my $self = $_[0]; ((my  $meth = undef) = (Main::bool(((1 + index($self->{metasyntax}, '.')))) ? $self->{metasyntax} : ('$grammar.' . $self->{metasyntax}))); (my  $code = undef); if (Main::bool(($self->{captures} == 1))) { ($code = 'if $m2 { $MATCH.to = $m2.to; $MATCH{\'' . $self->{metasyntax} . '\'} = $m2; 1 } else { False }; ') } else { if (Main::bool(($self->{captures} > 1))) { ($code = 'if $m2 { ' . '$MATCH.to = $m2.to; ' . 'if exists $MATCH{\'' . $self->{metasyntax} . '\'} { ' . '($MATCH{\'' . $self->{metasyntax} . '\'}).push( $m2 ); ' . '} ' . 'else { ' . '$MATCH{\'' . $self->{metasyntax} . '\'} = [ $m2 ]; ' . '}; ' . '1 ' . '} else { False }; ') } else { ($code = 'if $m2 { $MATCH.to = $m2.to; 1 } else { False }; ') } }; '(do { ' . 'my $m2 = ' . $meth . '($str, $MATCH.to); ' . $code . '})' };
sub set_captures_to_array { my $self = $_[0]; if (Main::bool(($self->{captures} > 0))) { ($self->{captures} = ($self->{captures} + 1)) }  }
}

;
{
package Rul::Var;
sub new { shift; bless { @_ }, "Rul::Var" }
sub sigil { $_[0]->{sigil} };
sub twigil { $_[0]->{twigil} };
sub name { $_[0]->{name} };
sub emit_perl6 { my $self = $_[0]; ((my  $table = undef) = do { (my  $Hash_a = {}); ($Hash_a->{'$'} = '$'); ($Hash_a->{'@'} = '$List_'); ($Hash_a->{'%'} = '$Hash_'); ($Hash_a->{'&'} = '$Code_'); $Hash_a }); $table->{$self->{sigil}} . $self->{name} }
}

;
{
package Rul::Constant;
sub new { shift; bless { @_ }, "Rul::Constant" }
sub constant { $_[0]->{constant} };
sub emit_perl6 { my $self = $_[0]; ((my  $str = undef) = $self->{constant}); Rul::constant($str) };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::Dot;
sub new { shift; bless { @_ }, "Rul::Dot" }
sub emit_perl6 { my $self = $_[0]; '( \'\' ne substr( $str, $MATCH.to, 1 ) ' . '&& ($MATCH.to = 1 + $MATCH.to)' . ')' };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::SpecialChar;
sub new { shift; bless { @_ }, "Rul::SpecialChar" }
sub char { $_[0]->{char} };
sub emit_perl6 { my $self = $_[0]; ((my  $char = undef) = $self->{char}); if (Main::bool(($char eq 'n'))) { return scalar (Rul::Subrule->new(('metasyntax' => 'is_newline'), ('captures' => 0))->emit_perl6()) } ; if (Main::bool(($char eq 'N'))) { return scalar (Rul::Subrule->new(('metasyntax' => 'not_newline'), ('captures' => 0))->emit_perl6()) } ; if (Main::bool(($char eq 'd'))) { return scalar (Rul::Subrule->new(('metasyntax' => 'digit'), ('captures' => 0))->emit_perl6()) } ; if (Main::bool(($char eq 's'))) { return scalar (Rul::Subrule->new(('metasyntax' => 'space'), ('captures' => 0))->emit_perl6()) } ; if (Main::bool(($char eq 't'))) { return scalar (Rul::constant(chr(9))) } ; return scalar (Rul::constant($char)) };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::Block;
sub new { shift; bless { @_ }, "Rul::Block" }
sub closure { $_[0]->{closure} };
sub emit_perl6 { my $self = $_[0]; '((do { ' . $self->{closure} . ' }) || 1)' };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::InterpolateVar;
sub new { shift; bless { @_ }, "Rul::InterpolateVar" }
sub var { $_[0]->{var} };
sub emit_perl6 { my $self = $_[0]; Main::say('# TODO: interpolate var ' . $self->{var}->emit_perl6() . ''); die() };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::NamedCapture;
sub new { shift; bless { @_ }, "Rul::NamedCapture" }
sub rule_exp { $_[0]->{rule_exp} };
sub capture_ident { $_[0]->{capture_ident} };
sub emit_perl6 { my $self = $_[0]; Main::say('# TODO: named capture ' . $self->{capture_ident} . ' = ' . $self->{rule_exp}->emit_perl6() . ''); die() };
sub set_captures_to_array { my $self = $_[0]; Main::say('# TODO: named capture ') }
}

;
{
package Rul::Before;
sub new { shift; bless { @_ }, "Rul::Before" }
sub rule_exp { $_[0]->{rule_exp} };
sub emit_perl6 { my $self = $_[0]; '(do { ' . 'my $tmp = $MATCH; ' . '$MATCH = Perlito::Match.new( \'str\' => $str, \'from\' => $tmp.to, \'to\' => $tmp.to, \'bool\' => 1  ); ' . '$MATCH.bool = ' . $self->{rule_exp}->emit_perl6() . '; ' . '$tmp.bool = ?$MATCH; ' . '$MATCH = $tmp; ' . '?$MATCH; ' . '})' };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::NotBefore;
sub new { shift; bless { @_ }, "Rul::NotBefore" }
sub rule_exp { $_[0]->{rule_exp} };
sub emit_perl6 { my $self = $_[0]; '(do { ' . 'my $tmp = $MATCH; ' . '$MATCH = Perlito::Match.new( \'str\' => $str, \'from\' => $tmp.to, \'to\' => $tmp.to, \'bool\' => 1  ); ' . '$MATCH.bool = ' . $self->{rule_exp}->emit_perl6() . '; ' . '$tmp.bool = !$MATCH; ' . '$MATCH = $tmp; ' . '?$MATCH; ' . '})' };
sub set_captures_to_array { my $self = $_[0];  }
}

;
{
package Rul::NegateCharClass;
sub new { shift; bless { @_ }, "Rul::NegateCharClass" }
sub chars { $_[0]->{chars} };
sub emit_perl6 { my $self = $_[0]; Main::say('TODO NegateCharClass'); die() }
}

;
{
package Rul::CharClass;
sub new { shift; bless { @_ }, "Rul::CharClass" }
sub chars { $_[0]->{chars} };
sub emit_perl6 { my $self = $_[0]; Main::say('TODO CharClass'); die() }
}

;
{
package Rul::Capture;
sub new { shift; bless { @_ }, "Rul::Capture" }
sub rule_exp { $_[0]->{rule_exp} };
sub emit_perl6 { my $self = $_[0]; Main::say('TODO RulCapture'); die() }
}

;
{
package Rul::CaptureResult;
sub new { shift; bless { @_ }, "Rul::CaptureResult" }
sub rule_exp { $_[0]->{rule_exp} };
sub emit_perl6 { my $self = $_[0]; Main::say('TODO Rul::CaptureResult'); die() }
}

;
{
package Rul::After;
sub new { shift; bless { @_ }, "Rul::After" }
sub rule_exp { $_[0]->{rule_exp} };
sub emit_perl6 { my $self = $_[0]; Main::say('TODO Rul::After'); die() }
}


}

1;
