use Test::More;
BEGIN { plan tests => 73 };
use autobox::Core;

#####################################################################
# Load
#####################################################################
ok(1);

#####################################################################
# Scalar
#####################################################################
ok(1->add(5) == 6);

ok(1->and(5));
ok(!1->and(0));

ok(1->band(5) == 1);

ok(1->bor(5) == 5);

ok(1->bxor(5) == 4);

ok(1->cmp(5) == -1);

ok(1->dec == 0);

ok(1->div(5) == 1/5);

ok(not 1->eq(5));

ok(1->flip != 1);

ok(not 1->ge(5));

ok(not 1->gt(5));

ok(1->inc == 2);

ok(1->le(5));

ok(1->lshift(5) == 32);

ok(1->lt(5));

ok(5->mod(2) == 1);

ok(1->mult(5) == 5);

ok(1->mcmp(5) < 0);

ok(1->ne(5));

ok(1->neg == -1);

ok(not 1->meq(5));

ok(not 1->mge(5));

ok(not 1->mgt(5));

ok(1->mle(5));

ok(1->mlt(5));

ok(1->mne(5));

ok(not 1->not);

ok(1->or(5));

ok(2->pow(5) == 32);

ok(1->rpt(5) eq '11111');

ok(5->rshift(1) == 2);

ok(1->sub(5) == -4);

ok(1->xor(5) == 4);

ok("1+5"->eval() == 6);

ok("echo test"->backtick =~ "test");

my $a = 1->to(10);
ok($a->[0] == 1 && $a->[@$a-1] == 10);
$a = 10->to(1);
ok($a->[0] == 10 && $a->[@$a-1] == 1);
my @a = 1->to(10);
is_deeply \@a, [ 1 .. 10 ];

$a = 1->upto(10);
ok($a->[0] == 1 && $a->[@$a-1] == 10);

@a = 1->upto(10);
is_deeply \@a, [ 1 .. 10 ];

$a = 10->downto(1);
ok($a->[0] == 10 && $a->[@$a-1] == 1);

@a = 10->downto(1);
is_deeply \@a, [ reverse 1 .. 10 ];

$a = 1;
ok(10->times(sub {$a++}) == 10);
ok($a == 11);

$a = 1;
$a++ for 10->times;
ok($a == 11);

#####################################################################
# Hashes
#####################################################################
my $h = {a => 1, b => 2, c => 3};
ok($h->at('b') == 2);

ok($h->get('c') == 3);

$h->put('d' => 4, e=>5, f=>6);
ok($h->get('e') == 5);
$h->put('g', 7);
ok($h->get('g') == 7);

$h->set('h' => 8);
ok($h->get('h') == 8);
$h->set('i', 9);
ok($h->get('i') == 9);

is_deeply(
  [ sort $h->flatten ],
  [ sort %$h ],
  "flattening gets us all the contents",
);

#####################################################################
# Array
#####################################################################
$a = 1->to(10);
ok($a->sum == 55);
ok($a->[0] == 1);

ok($a->mean == 55/10);

ok($a->var == 33/4);

ok($a->svar == 55/6);

ok($a->max == 10);

ok($a->min == 1);

ok($a->exists(5));
ok(not $a->exists(11));

$a = $a->map(sub {int($_/2)});
ok($a->exists(3));
$a->vdelete(3);
ok(not $a->exists(3));

ok($a->at(0) == 0);

ok($a->count(4) == 2);

$a = $a->uniq;
ok($a->count(1) == 1 && $a->count(4) == 1);

ok($a->first == 0);
ok($a->first(sub { m/4/ }) == 4);
ok($a->first(qr/4/) == 4);

$a = 1->to(10);
$a->unshift(100);
ok($a->sum == 155);





