requires 'perl', '5.008001';
requires 'LWP::Simple';
requires 'XML::Simple';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

