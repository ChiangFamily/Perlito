# Do not edit this file - Generated by Perlito5 8.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito5::Perl5::Runtime;
our $MATCH = Perlito5::Match->new();
package main;
use v5;
package Perlito5::Javascript::CORE;
sub emit_javascript {
    return (chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' lib' . chr(47) . 'Perlito5' . chr(47) . 'Javascript' . chr(47) . 'CORE.js' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' CORE functions for ' . chr(34) . 'Perlito' . chr(34) . ' Perl5-in-Javascript' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' AUTHORS' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' Flavio Soibelmann Glock  fglock' . chr(64) . 'gmail.com' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' COPYRIGHT' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' Copyright 2009, 2010, 2011, 2012 by Flavio Soibelmann Glock and others.' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' This program is free software' . chr(59) . ' you can redistribute it and' . chr(47) . 'or modify it' . chr(10) . chr(47) . chr(47) . ' under the same terms as Perl itself.' . chr(10) . chr(47) . chr(47) . chr(10) . chr(47) . chr(47) . ' See http:' . chr(47) . chr(47) . 'www.perl.com' . chr(47) . 'perl' . chr(47) . 'misc' . chr(47) . 'Artistic.html' . chr(10) . chr(10) . 'var CORE ' . chr(61) . ' NAMESPACE.CORE' . chr(59) . chr(10) . chr(10) . 'var _print_buf ' . chr(61) . ' ' . chr(34) . chr(34) . chr(59) . chr(10) . 'CORE.print ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var i' . chr(59) . chr(10) . '    for (i ' . chr(61) . ' 0' . chr(59) . ' i < List__.length' . chr(59) . ' i++) ' . chr(123) . chr(10) . '        var s ' . chr(61) . ' string(List__[i])' . chr(59) . chr(10) . '        if (s.substr(s.length - 2, 2) ' . chr(61) . chr(61) . ' ' . chr(34) . chr(92) . 'n' . chr(34) . ') ' . chr(123) . chr(10) . '            print(_print_buf + s.substr(0, s.length - 2))' . chr(59) . chr(10) . '            _print_buf ' . chr(61) . ' ' . chr(34) . chr(34) . chr(59) . chr(10) . '        ' . chr(125) . chr(10) . '        else if (s.substr(s.length - 1, 1) ' . chr(61) . chr(61) . ' ' . chr(34) . chr(92) . 'n' . chr(34) . ') ' . chr(123) . chr(10) . '            print(_print_buf + s.substr(0, s.length - 1))' . chr(59) . chr(10) . '            _print_buf ' . chr(61) . ' ' . chr(34) . chr(34) . chr(59) . chr(10) . '        ' . chr(125) . chr(10) . '        else ' . chr(123) . chr(10) . '            _print_buf ' . chr(61) . ' _print_buf + s' . chr(59) . chr(10) . '        ' . chr(125) . chr(10) . '    ' . chr(125) . chr(10) . '    return true' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.say ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    CORE.print(List__)' . chr(59) . chr(10) . '    return CORE.print([' . chr(34) . chr(92) . 'n' . chr(34) . '])' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.die ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var i' . chr(59) . chr(10) . '    var s ' . chr(61) . ' ' . chr(34) . chr(34) . chr(59) . chr(10) . '    for (i ' . chr(61) . ' 0' . chr(59) . ' i < List__.length' . chr(59) . ' i++) ' . chr(123) . chr(10) . '        s ' . chr(61) . ' s + string(List__[i])' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    throw(new Error(' . chr(34) . 'Died: ' . chr(34) . ' + s))' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.warn ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var i' . chr(59) . chr(10) . '    var s ' . chr(61) . ' ' . chr(34) . chr(34) . chr(59) . chr(10) . '    for (i ' . chr(61) . ' 0' . chr(59) . ' i < List__.length' . chr(59) . ' i++) ' . chr(123) . chr(10) . '        s ' . chr(61) . ' s + string(List__[i])' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    CORE.print([' . chr(34) . 'Warning: ' . chr(34) . ' + s + ' . chr(34) . chr(92) . 'n' . chr(34) . '])' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.bless ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o        ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var pkg_name ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    if (typeof pkg_name ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'object' . chr(34) . ') ' . chr(123) . chr(10) . '        ' . chr(47) . chr(47) . ' bless ' . chr(123) . chr(125) . ', Class' . chr(10) . '        o._class_ ' . chr(61) . ' pkg_name' . chr(59) . chr(10) . '        return o' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (' . chr(33) . 'CLASS.hasOwnProperty(pkg_name)) ' . chr(123) . chr(10) . '        make_package(pkg_name)' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    o._class_ ' . chr(61) . ' CLASS[pkg_name]' . chr(59) . chr(10) . '    return o' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.chr ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    return String.fromCharCode(num(List__[0]))' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.ord ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    return string(List__[0]).charCodeAt(0)' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.substr ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var expr        ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var offset      ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    var length      ' . chr(61) . ' List__[2]' . chr(59) . chr(10) . '    var replacement ' . chr(61) . ' List__[3]' . chr(59) . chr(10) . '    return string(expr).substr(offset, length)' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.scalar ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return 1' . chr(59) . chr(10) . '    ' . chr(125) . chr(59) . chr(10) . '    if (typeof o.scalar ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'function' . chr(34) . ') ' . chr(123) . chr(10) . '        return o.scalar()' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (typeof o ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'object' . chr(34) . ' ' . chr(38) . chr(38) . ' (o instanceof Array)) ' . chr(123) . chr(10) . '        return o.length' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    switch (typeof o) ' . chr(123) . chr(10) . '        case ' . chr(34) . 'string' . chr(34) . ': return 1' . chr(59) . chr(10) . '        case ' . chr(34) . 'function' . chr(34) . ': return 1' . chr(59) . chr(10) . '        case ' . chr(34) . 'number' . chr(34) . ': return 1' . chr(59) . chr(10) . '        case ' . chr(34) . 'boolean' . chr(34) . ': return 1' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    var l ' . chr(61) . ' 0' . chr(59) . chr(10) . '    for (var i in o) ' . chr(123) . chr(10) . '        l++' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return l' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.values ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return []' . chr(59) . chr(10) . '    ' . chr(125) . chr(59) . chr(10) . '    if (typeof o.values ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'function' . chr(34) . ') ' . chr(123) . chr(10) . '        return o.values()' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    var out ' . chr(61) . ' []' . chr(59) . chr(10) . '    for (var i in o) ' . chr(123) . chr(10) . '        out.push(o[i])' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return out' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.keys ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return []' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (typeof o.keys ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'function' . chr(34) . ') ' . chr(123) . chr(10) . '        return o.keys()' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    var out ' . chr(61) . ' []' . chr(59) . chr(10) . '    for (var i in o) ' . chr(123) . chr(10) . '        out.push(i)' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return out' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.pop ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o.length ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return null' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return o.pop()' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.shift ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o.length ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return null' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return o.shift()' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.push ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var v ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    return o.push(v)' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.unshift ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var v ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    return o.unshift(v)' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.join ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var s ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var o ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    return o.join(s)' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.index ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var s ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    try ' . chr(123) . chr(10) . '        return o.indexOf(s)' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    catch(err) ' . chr(123) . chr(10) . '        return -1' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.length ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (typeof o.string ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'function' . chr(34) . ') ' . chr(123) . chr(10) . '        return o.string().length' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return o.length' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.ref ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var o ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    if (o ' . chr(61) . chr(61) . ' null) ' . chr(123) . chr(10) . '        return ' . chr(34) . chr(34) . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (o._class_ ' . chr(38) . chr(38) . ' typeof o._class_._ref_ ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'string' . chr(34) . ') ' . chr(123) . chr(10) . '        ' . chr(47) . chr(47) . ' blessed reference' . chr(10) . '        return o._class_._ref_' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (typeof o._ref_ ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'string' . chr(34) . ') ' . chr(123) . chr(10) . '        ' . chr(47) . chr(47) . ' un-blessed reference' . chr(10) . '        return o._ref_' . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    if (typeof o ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'function' . chr(34) . ') ' . chr(123) . chr(10) . '        return ' . chr(34) . 'CODE' . chr(34) . chr(59) . chr(10) . '    ' . chr(125) . chr(10) . '    return ' . chr(34) . chr(34) . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10) . 'CORE.split ' . chr(61) . ' function(List__) ' . chr(123) . chr(10) . '    var pattern ' . chr(61) . ' List__[0]' . chr(59) . chr(10) . '    var s       ' . chr(61) . ' List__[1]' . chr(59) . chr(10) . '    var limit   ' . chr(61) . ' List__[2]' . chr(59) . chr(10) . '    if (typeof pattern ' . chr(61) . chr(61) . chr(61) . ' ' . chr(34) . 'string' . chr(34) . ') ' . chr(123) . chr(10) . '        if (pattern ' . chr(61) . chr(61) . ' ' . chr(34) . ' ' . chr(34) . ') ' . chr(123) . chr(10) . '            var res' . chr(59) . chr(10) . '            for (var i_ ' . chr(61) . ' 0, a_ ' . chr(61) . ' s.split(pattern)' . chr(59) . ' i_ < a_.length ' . chr(59) . ' i_++) ' . chr(123) . chr(10) . '                if (a_[i_] ' . chr(33) . chr(61) . ' ' . chr(34) . chr(34) . ') ' . chr(123) . chr(10) . '                    res.push(a_[i_])' . chr(10) . '                ' . chr(125) . chr(10) . '            ' . chr(125) . chr(10) . '            return res' . chr(59) . chr(10) . '        ' . chr(125) . chr(10) . '    ' . chr(125) . chr(10) . '    CORE.die([' . chr(34) . 'not implemented' . chr(34) . '])' . chr(59) . chr(10) . chr(125) . chr(59) . chr(10) . chr(10))
};
1;

1;
