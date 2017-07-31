use PGObject::Util::PGConfig;
use Test::More;

use DBI;

plan skip_all => 'DB_TESTING is not set' unless $ENV{DB_TESTING};

plan tests => 2;

my $config = PGObject::Util::PGConfig;

isa($config, 'PGObject::Util::PGConfig', 'Got back a PGObject::Util::PGConfig object')
$config->set('max_connections', 2000);
$config->set('statement_timeout', 500);
$config->set('nonexistent_nonsense', 'fooooooo');

$dbh = DBI->connect('dbi::Pg::dbname=postgres');

is(scalar $config->apply_system($dbh), 2, 'Applied 2 config changes');
