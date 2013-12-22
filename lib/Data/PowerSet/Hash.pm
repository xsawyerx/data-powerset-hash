package Data::PowerSet::Hash;
# ABSTRACT: Power sets of hashes

use strict;
use warnings;
use parent 'Exporter';
use Data::PowerSet 'powerset';

our @EXPORT_OK = 'hash_powerset';

sub hash_powerset {
    my %hash = @_;
    my @pset = ();
    my $pset = powerset( keys %hash );

    foreach my $combo ( @{$pset} ) {
        push @pset, {
            map +( $_ => $hash{$_} ), @{$combo}
        };
    }

    return @pset;
}

1;

__END__

=head1 DESCRIPTION

This provides you with a power set (basically all combinational iterations) for
your hashes. This only does it for hashes, if you want them done for arrays, I
suggest using L<Data::PowerSet>. Please view the I<SEE ALSO> section below.

=head1 SUBROUTINES/METHODS

=head2 hash_powerset

Create a powerset from hash keys.

    use Data::PowerSet::Hash 'hash_powerset';

    my @pset = hash_powerset(
        husband => 'Homer Simpson',
        wife    => 'Marge Simpson',
    );

    # @pset = (
    #     {
    #         husband => 'Homer Simpson',
    #         wife    => 'Marge Simpson',
    #     },
    #     { husband => 'Homer Simpson' },
    #     { wife    => 'Marge Simpson' },
    #     {},
    # )

=head2 EXPORT

=head3 hash_powerset(%hash)

See documentation for it above.

=head1 SEE ALSO

For arrays, you should check out L<Data::PowerSet> or L<List::PowerSet>.

