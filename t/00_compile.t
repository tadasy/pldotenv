use strict;
use Test::More 0.98;
use Dir::Self;
use Data::Dumper;

subtest 'use test.' => sub {
    use_ok $_ for qw(
        Dotenv
    );
};

subtest 'file not found test.' => sub {
    eval {
        Dotenv::load(__DIR__ . '/fixtures/.notfound');
    };
    if ($@) {
        pass();
    } else {
        fail();
    }
};

subtest 'basic test.' => sub {
    Dotenv::load(__DIR__ . '/fixtures/', '.basic');
    is $ENV{'key1'}, 'val1';
    is $ENV{'key2'}, 'val2';
    $ENV{'key1'} = undef;
    $ENV{'key2'} = undef;
};

subtest 'defalut file name test.' => sub {
    Dotenv::load(__DIR__ . '/fixtures/');
    is $ENV{'key1'}, 'val1';
    $ENV{'key1'} = undef;
};

subtest 'space test.' => sub {
    Dotenv::load(__DIR__ . '/fixtures/', '.space');
    is $ENV{'key1'}, 'val1';
    $ENV{'key1'} = undef;
};

subtest 'comment test.' => sub {
    Dotenv::load(__DIR__ . '/fixtures/', '.comment');
    is $ENV{'key1'}, 'val1';
    is $ENV{'key2'}, undef;
    $ENV{'key1'} = undef;
    $ENV{'key2'} = undef;
};

done_testing;
