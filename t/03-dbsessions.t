use Test::More;

use PGObject::Util::PGConfig;

plan skip_all => 'DB_TESTING not set' unless $ENV{DB_TESTING};

plan tests => 6;

require DBI;

my $dbh = DBI->connect('dbi:Pg:dbname=postgres');
ok($dbh, 'got a database handle');
my $config = PGObject::Util::PGConfig->new();
ok($config, 'got a config object');

ok(scalar (grep {$_ eq 'statement_timeout'} $config->list($dbh)), 
    'statement_timeout found in config list for session');
$config->set('statement_timeout', 314);
$config->set('enable_seqscan', 'no');

$config->sync_session($dbh, $config->known_keys);
my $config2 = PGObject::Util::PGConfig->new();
ok($config2, 'second config object');
$config2->fetch($dbh, $_) for $config->known_keys;
is($config2->get_value('statement_timeout'), "314ms", 'Correct statement timeout');
is($config2->get_value('enable_seqscan'), 'off', 'correct enable_seqscan value');
