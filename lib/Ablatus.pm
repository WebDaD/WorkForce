package Ablatus;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(func1 func2);
%EXPORT_TAGS = ( DEFAULT => [qw(&func1)],
                 Both    => [qw(&func1 &func2)]);

sub func1  { return reverse @_  }
sub func2  { return map{ uc }@_ }

1;

# Usage in Skripts:
# case 1
# use MyModule;
# print func1(@list),"\n";
# print func2(@list),"\n";

# case 2
# use MyModule qw(&func1);
# print func1(@list),"\n";
# print MyModule::func2(@list),"\n";

# case 3
# use MyModule qw(:DEFAULT);
# print func1(@list),"\n";
# print func2(@list),"\n";

# case 4
# use MyModule qw(:Both);
# print func1(@list),"\n";
# print func2(@list),"\n";