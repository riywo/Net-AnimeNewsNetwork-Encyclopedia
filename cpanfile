requires 'perl', '5.010000';
requires 'LWP::Simple';
requires 'XML::Simple';
requires 'Moo';
requires 'Data::Validator';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::Fake::HTTPD';
    requires 'Path::Tiny';
    requires 'Try::Tiny';
};

