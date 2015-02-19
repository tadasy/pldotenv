use strict;
use Test::More 0.98 tests =>6;
use Data::Dumper;
use FindBin;

subtest 'use test.' => sub {
    use_ok $_ for qw(
        Dotenv
    );
};

subtest 'file not found test.' => sub {
    eval {
        Dotenv::load($FindBin::Bin . '/fixtures', '.notfound');
    };
    if ($@) {
        pass();
    } else {
        fail();
    }
};

subtest 'basic test.' => sub {
    eval {
        Dotenv::load($FindBin::Bin . '/fixtures', '.basic');
    };
    if ($@) {
        fail($@);
    }

    is $ENV{'key1'}, 'val1';
    is $ENV{'key2'}, 'val2';
    $ENV{'key1'} = undef;
    $ENV{'key2'} = undef;
};

subtest 'defalut file name test.' => sub {
    Dotenv::load($FindBin::Bin . '/fixtures');
    is $ENV{'key1'}, 'val1';
    $ENV{'key1'} = undef;
};

subtest 'space test.' => sub {
    Dotenv::load($FindBin::Bin . '/fixtures', '.space');
    is $ENV{'key1'}, 'val1';
    $ENV{'key1'} = undef;
};

subtest 'comment test.' => sub {
    Dotenv::load($FindBin::Bin . '/fixtures', '.comment');
    is $ENV{'key1'}, 'val1';
    is $ENV{'key2'}, undef;
    $ENV{'key1'} = undef;
    $ENV{'key2'} = undef;
};

done_testing;
