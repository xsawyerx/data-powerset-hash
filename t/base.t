#!perl

use strictures 1;

use Test::More tests => 3;
use Data::PowerSet::Hash 'hash_powerset';

my @hash = hash_powerset;
is_deeply( [ hash_powerset ], [ {} ], 'Empty powerset' );

{
    my @pset = hash_powerset(
        ack => 'back',
    );

    my $data = [
        { ack => 'back' },
        {},
    ];

    is_deeply( \@pset, $data, 'Simple powerset' );
}

{
    my @pset = hash_powerset(
        husband => 'Homer Simpson',
        wife    => 'Marge Simpson',
    );

    my $data = [
        {
            husband => 'Homer Simpson',
            wife    => 'Marge Simpson',
        },
        { husband => 'Homer Simpson' },
        { wife    => 'Marge Simpson' },
        {},
    ];

    is_deeply( \@pset, $data, 'Simpsonset' );
}

