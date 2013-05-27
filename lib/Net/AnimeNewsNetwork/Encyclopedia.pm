package Net::AnimeNewsNetwork::Encyclopedia;
use 5.10.0;
use strict;
use warnings;
use Moo;
use Data::Validator;
use URI;
use LWP::Simple;

our $VERSION = "0.01";
our $URL = 'http://cdn.animenewsnetwork.com/encyclopedia';

has url => (
    is      => 'ro',
    default => $URL,
);

sub get_reports {
    state $rule = Data::Validator->new(
        id    => 'Int',
        type  => 'Str',
        nskip => { isa => 'Int', optional => 1 },
        nlist => { isa => 'Int', optional => 1 },
        name  => { isa => 'Str', optional => 1 },
    )->with('Method');
    my ($self, $args) = $rule->validate(@_);

    my $uri = URI->new($self->url."/reports.xml");
    $uri->query_form($args);
    return get($uri);
}

1;
__END__

=encoding utf-8

=head1 NAME

Net::AnimeNewsNetwork::Encyclopedia - It's new $module

=head1 SYNOPSIS

    use Net::AnimeNewsNetwork::Encyclopedia;

=head1 DESCRIPTION

Net::AnimeNewsNetwork::Encyclopedia is ...

=head1 LICENSE

Copyright (C) Ryosuke IWANAGA.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Ryosuke IWANAGA E<lt>riywo.jp@gmail.comE<gt>

=cut

