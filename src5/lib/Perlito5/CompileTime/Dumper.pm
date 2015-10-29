package Perlito5::CompileTime::Dumper;

use strict;

sub generate_eval_string {
    my ($source) = @_;
    my $m = Perlito5::Grammar::exp_stmts($source, 0);
    my @data = Perlito5::Match::flat($m)->[0]->emit_perl5;
    my $out = [];
    Perlito5::Perl5::PrettyPrinter::pretty_print( \@data, 0, $out );
    my $source_new = join( '', @$out ), ";1\n";
    # print STDERR "[[[ $source ]]]\n";
    # print STDERR "[[[ $source_new ]]]\n";
    return $source_new;
}

sub _dumper {
    my ($obj, $tab, $seen, $pos) = @_;

    return 'undef' if !defined $obj;

    my $ref = ref($obj);
    return Perlito5::Dumper::escape_string($obj) if !$ref;

    my $as_string = "$obj";
    return $seen->{$as_string} if $seen->{$as_string};
    $seen->{$as_string} = $pos;
        
    my $tab1 = $tab . '    ';

    if ($ref eq 'ARRAY') {
        return '[]' unless @$obj;
        my @out;
        for my $i ( 0 .. $#$obj ) {
            my $here = $pos . '->[' . $i . ']';
            push @out, 
                $tab1,
                _dumper($obj->[$i], $tab1, $seen, $here), 
                ",\n";
        }
        return join('', "[\n", @out, $tab, ']');
    }
    elsif ($ref eq 'HASH') {
        return '{}' unless keys %$obj;
        my @out;
        for my $i ( sort keys %$obj ) {
            my $here = $pos . '->{' . $i . '}';
            push @out, 
                $tab1,
                "'$i' => ",
                _dumper($obj->{$i}, $tab1, $seen, $here), 
                ",\n";
        }
        return join('', "{\n", @out, $tab, '}');
    }
    elsif ($ref eq 'SCALAR') {
        return "\\" . _dumper($$obj, $tab1, $seen, $pos);
    }
    elsif ($ref eq 'CODE') {
        # TODO
        my $closure_flag = bless {}, "Perlito5::dump";
        my $captures = $obj->($closure_flag) // {};
        my @vars = keys %$captures;
        return join('',
            'do { ',
            (map { 'my ' . $_ . ' = ' . _dumper($captures->{$_}) . '; ' } @vars),
            'sub { "DUMMY" } ',
            '}'
        );
    }

    # TODO find out what kind of reference this is (ARRAY, HASH, ...)
    # local $@;
    # eval {
    #     my @data = @$obj;
    #     say "is array";
    #     return 'bless(' . "..." . ", '$ref')";
    # }
    # or eval {
    #     $@ = '';
    #     my %data = %$obj;
    #     say "is hash";
    #     return 'bless(' . "..." . ", '$ref')";
    # };
    # $@ = '';
    
    # assume it's a blessed HASH
    
    my @out;
    for my $i ( sort keys %$obj ) {
        my $here = $pos . '->{' . $i . '}';
        push @out, 
            $tab1,
            "'$i' => ",
            _dumper($obj->{$i}, $tab1, $seen, $here), 
            ",\n";
    }
    return join('', "bless({\n", @out, $tab, "}, '$ref')");
}

sub _dump_global {
    my ($item, $seen, $dumper_seen, $vars, $tab) = @_;
    my $n = $item->{sigil} . $item->{namespace} . "::" . $item->{name};
    if (!$seen->{$n}) {
        if ($item->{sigil} eq '$') {
            push @$vars, $tab . "$n = " . _dumper( eval $n, "  ", $dumper_seen, $n ) . ";\n";
        }
        elsif ($item->{sigil} eq '@' || $item->{sigil} eq '%') {
            my $ref = "\\$n";
            my $d = _dumper( eval $ref, $tab . "  ", $dumper_seen, $ref );
            if ($d eq '[]' || $d eq '{}') {
                push @$vars, $tab . "$n = ();\n"
            }
            else {
                push @$vars, $tab . "$n = " . $item->{sigil} . "{" . $d . "};\n";
            }
        }
        elsif ($item->{sigil} eq '*') {
            # TODO - look for aliasing
            #   *v1 = \$v2
            push @$vars, $tab . "# $n\n";
            for (qw/ $ @ % /) {
                local $item->{sigil} = $_;
                _dump_global($item, $seen, $dumper_seen, $vars, $tab);
            }
        }
        $seen->{$n} = 1;
    }
}

sub _emit_globals {
    my ($scope, $seen, $dumper_seen, $vars, $tab) = @_;
    my $block = $scope->{block};
    for my $item (@$block) {
        if (ref($item) eq 'Perlito5::AST::Var' && !$item->{_decl}) {
            $item->{_decl} = 'global';
        }
        if (ref($item) eq 'Perlito5::AST::Var' && $item->{_decl} eq 'global') {
            $item->{namespace} ||= $item->{_namespace};
            next if $item->{name} eq '0' || $item->{name} > 0;  # skip regex and $0
            _dump_global($item, $seen, $dumper_seen, $vars, $tab);
        }
        if (ref($item) eq 'Perlito5::AST::Var' && $item->{_decl} eq 'my') {
            my $id = $item->{_id};
            if (!$seen->{$id}) {
                push @$vars, $tab . "# my " . $item->{sigil} . $item->{name} . ";\n";
            }
            $seen->{$id} = 1;
        }
        if ( ref($item) eq 'HASH' && $item->{block} ) {
            # lookup in the inner scope
            push @$vars, $tab . "{\n";
            _emit_globals($item, $seen, $dumper_seen, $vars, $tab . "  ");
            push @$vars, $tab . "}\n";
        }
    }
}

sub emit_globals {
    # return a structure with the global variable declarations
    # this is used to initialize the ahead-of-time program
    my $scope = shift() // $Perlito5::BASE_SCOPE;
    my @vars;
    my %seen;
    my $dumper_seen = {};
    my $tab = "";
    _emit_globals($scope, \%seen, $dumper_seen, \@vars, $tab);
    return join("", @vars);
}

1;

