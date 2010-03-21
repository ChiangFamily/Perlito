# Do not edit this file - Generated by MiniPerl6 3.0
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
our $MATCH = MiniPerl6::Match->new();
{
package MiniPerl6::Grammar;
sub new { shift; bless { @_ }, "MiniPerl6::Grammar" }
sub pair_key { my $grammar = $_[0]; my $str = $_[1]; my $pos = $_[2]; my  $MATCH; ($MATCH = MiniPerl6::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, )); (($MATCH)->{bool} = do { (my  $pos1 = $MATCH->to()); (do { (do { (my  $m2 = $grammar->ident($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'ident'} = $m2);1 } else { 0 } } && (do { (my  $tmp = $MATCH); ($MATCH = MiniPerl6::Match->new( 'str' => $str,'from' => $tmp->to(),'to' => $tmp->to(),'bool' => 1, )); (($MATCH)->{bool} = do { (my  $pos1 = $MATCH->to()); (do { (('=>' eq substr($str, $MATCH->to(), 2)) ? (1 + (($MATCH)->{to} = (2 + $MATCH->to()))) : 0) } || do { (($MATCH)->{to} = $pos1); do { (my  $m2 = $grammar->ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } }) }); (($tmp)->{bool} = ($MATCH ? 1 : 0)); ($MATCH = $tmp); ($MATCH ? 1 : 0) } && (do { ($MATCH->{capture} = (Val::Buf->new( 'buf' => ("" . $MATCH->{'ident'}), ))) } || 1))) } || do { (($MATCH)->{to} = $pos1); (do { (my  $m2 = $grammar->exp($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'exp'} = $m2);1 } else { 0 } } && (do { ($MATCH->{capture} = (${$MATCH->{'exp'}})) } || 1)) }) }); $MATCH };
sub pair { my $grammar = $_[0]; my $str = $_[1]; my $pos = $_[2]; my  $MATCH; ($MATCH = MiniPerl6::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, )); (($MATCH)->{bool} = do { (my  $pos1 = $MATCH->to()); (do { (do { (my  $m2 = $grammar->pair_key($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'pair_key'} = $m2);1 } else { 0 } } && (do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } && ((('=>' eq substr($str, $MATCH->to(), 2)) ? (1 + (($MATCH)->{to} = (2 + $MATCH->to()))) : 0) && (do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } && (do { (my  $m2 = $grammar->exp($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'exp'} = $m2);1 } else { 0 } } && (do { ($MATCH->{capture} = ([${$MATCH->{'pair_key'}}, ${$MATCH->{'exp'}}])) } || 1)))))) } || do { (($MATCH)->{to} = $pos1); (((':' eq substr($str, $MATCH->to(), 1)) ? (1 + (($MATCH)->{to} = (1 + $MATCH->to()))) : 0) && (do { (my  $m2 = $grammar->var_sigil($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'var_sigil'} = $m2);1 } else { 0 } } && (do { (my  $m2 = $grammar->ident($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'ident'} = $m2);1 } else { 0 } } && (do { ($MATCH->{capture} = ([Val::Buf->new( 'buf' => ("" . $MATCH->{'ident'}), ), Var->new( 'sigil' => ("" . ${$MATCH->{'var_sigil'}}),'twigil' => '','name' => ${$MATCH->{'ident'}}, )])) } || 1)))) }) }); $MATCH };
sub exp_mapping { my $grammar = $_[0]; my $str = $_[1]; my $pos = $_[2]; my  $MATCH; ($MATCH = MiniPerl6::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, )); (($MATCH)->{bool} = do { (my  $pos1 = $MATCH->to()); (do { (do { (my  $m2 = $grammar->pair($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'pair'} = $m2);1 } else { 0 } } && do { (my  $pos1 = $MATCH->to()); (do { (do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } && (((',' eq substr($str, $MATCH->to(), 1)) ? (1 + (($MATCH)->{to} = (1 + $MATCH->to()))) : 0) && (do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } && (do { (my  $m2 = $grammar->exp_mapping($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());($MATCH->{'exp_mapping'} = $m2);1 } else { 0 } } && (do { ($MATCH->{capture} = ([${$MATCH->{'pair'}}, @{${$MATCH->{'exp_mapping'}}}])) } || 1))))) } || do { (($MATCH)->{to} = $pos1); (do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } } && (do { (my  $pos1 = $MATCH->to()); (do { (((',' eq substr($str, $MATCH->to(), 1)) ? (1 + (($MATCH)->{to} = (1 + $MATCH->to()))) : 0) && do { (my  $m2 = $grammar->opt_ws($str, $MATCH->to())); if ($m2) { (($MATCH)->{to} = $m2->to());1 } else { 0 } }) } || do { (($MATCH)->{to} = $pos1); 1 }) } && (do { ($MATCH->{capture} = ([${$MATCH->{'pair'}}])) } || 1))) }) }) } || do { (($MATCH)->{to} = $pos1); (do { ($MATCH->{capture} = ([])) } || 1) }) }); $MATCH }
}

1;
