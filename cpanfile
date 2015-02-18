requires 'perl', '5.008001';

on 'develop' => sub {
    requires 'Software::License'
};

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Dir::Self', '0.10';
};

