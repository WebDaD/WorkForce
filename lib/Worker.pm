package Worker;

use strict;
use Exporter;
use IO::Socket::INET;
use Net::Ping;
use File::Pid;
use JSON;
use POSIX qw(strftime);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(&init &fork &dplog &signalHandler $dieNow);
%EXPORT_TAGS = ( All => [qw(&init &fork &dplog &signalHandler $dieNow)],
                 Both    => [qw(&func1 &func2)]);

my $dieNow = 0;

sub init{
	my ($aname) = @_;
	my $pidFilePath   = "/var/run/";
	my $pidFile       = $pidFilePath . $aname . ".pid";
	use POSIX qw(setsid);
	chdir '/';
	umask 0;
	open STDIN,  '/dev/null'   or die "Can't read /dev/null: $!";
	open STDOUT, '>>/dev/null' or die "Can't write to /dev/null: $!";
	open STDERR, '>>/dev/null' or die "Can't write to /dev/null: $!";
	defined( my $pid = fork ) or die "Can't fork: $!";
	exit if $pid;
	POSIX::setsid() or die "Can't start a new session.";
	$SIG{INT} = $SIG{TERM} = $SIG{HUP} = \&signalHandler;
	$SIG{PIPE} = 'ignore';
	my $pidfile = File::Pid->new( { file => $pidFile, } );
	return $pidfile;
}
sub fork{
	my ($aname) = @_;
	my $pidFilePath   = "/var/run/";
	
	use POSIX qw(setsid);
	chdir '/';
	umask 0;
	open STDIN,  '/dev/null'   or die "Can't read /dev/null: $!";
	open STDOUT, '>>/dev/null' or die "Can't write to /dev/null: $!";
	open STDERR, '>>/dev/null' or die "Can't write to /dev/null: $!";
	defined( my $pid = fork ) or die "Can't fork: $!";
	exit if $pid;
	POSIX::setsid() or die "Can't start a new session.";
	$SIG{INT} = $SIG{TERM} = $SIG{HUP} = \&signalHandler;
	$SIG{PIPE} = 'ignore';
	my $pidFile       = $pidFilePath . $aname ."-". $pid . ".pid";
	my $pidfile = File::Pid->new( { file => $pidFile, } );
	return $pidfile;
}

sub listen{
	my ($port) = @_;
	my $socket = new IO::Socket::INET (
		    LocalHost => '0.0.0.0',
		    LocalPort => $port,
		    Proto => 'tcp',
		    Listen => 5,
		    Reuse => 1
		);
	return $socket;
}

sub dplog{
	my ($debug,$text) = @_;
	if($debug ne 0){
		print strftime("%Y-%m-%dT%H:%M:%S", localtime(time())).": ".$text."\n";
	}
}
sub signalHandler{
	$dieNow = 1;  
}

1;


# TAGS: Sensor, Watcher, All, Executor

# Usage in Skripts:

# use File::Basename qw(dirname);
# use Cwd  qw(abs_path);
# use lib dirname(dirname abs_path $0) . '/lib';
# use Worker qw(:DEFAULT);
# print func1(@list),"\n";
# print func2(@list),"\n";
