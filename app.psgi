use strict;
use warnings;

use Plack::App::Directory;
use Plack::Builder;

builder {
    enable sub {
        my $app = $_[0];

        sub { $_[0]{PATH_INFO} =~ s|^/$|/index.html|; &$app };
    };

    Plack::App::Directory->new->to_app;
}
