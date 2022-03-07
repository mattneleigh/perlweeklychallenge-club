#!/usr/bin/env raku

use Test;

is pisano-period(3), 8;

sub pisano-period(\n)
{
    my $mods := (0, 1, * + * ... *).map(* mod n).head(1000).List;

    for 1..500
    {
        my $r := $mods.rotor($_).List;
        return $r.head.elems if [eqv] $r;
    }
}
