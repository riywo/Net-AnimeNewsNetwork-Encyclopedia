use strict;
use Test::More;
use Test::Fake::HTTPD;
use Path::Tiny;
use XML::Simple;
use Try::Tiny;
use Net::AnimeNewsNetwork::Encyclopedia;

my $httpd = run_http_server {
    my $req = shift;
    my $reports_xml = path("t/xml/reports_xml_id_155_type_anime")->absolute->slurp;
    return HTTP::Response->new(200, undef, undef, $reports_xml);
};
my $ann = Net::AnimeNewsNetwork::Encyclopedia->new(url => $httpd->endpoint);

subtest 'GET Reports API' => sub {
  my $content = $ann->get_reports(id => 155, type => 'anime');
  ok defined $content;
  try   {
    XMLin($content);
    pass;
  } catch { fail; }
};

done_testing;
