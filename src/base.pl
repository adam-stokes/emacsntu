#!/usr/bin/env perl

use strict;
use warnings;
use 5.008;
use YAML;
use File::chdir;
use File::Path qw(make_path);
use File::Spec::Functions qw[catdir catfile];
use File::Slurp;
use File::HomeDir;

sub initialize {
	my ($conf) = @_;
	my $home = File::HomeDir->my_home;
	my $init_el = catfile($home, ".emacs.d/init.el");
	foreach (@{$conf->{script}}) {
		print "running: $_\n";
		`$_`;
	}
  make_path(catdir($home, '.emacs.d')) unless -d catdir($home, '.emacs.d');
  local $CWD = catdir($home, '.emacs.d');
	write_file($init_el, {binmode => ':raw'}, $conf->{init_el});
}

###############################################################################
# YAML Configuration
###############################################################################
my $emacs_conf = YAML::Load << '...';
---
name: emacs
description: Emacs editor and plugins
init_el: |
  (require 'package)
  (add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
script:
  - sudo apt-get -y install python-software-properties
  - sudo apt-add-repository -y ppa:ubuntu-elisp/ppa
  - sudo apt-get update
  - sudo apt-get -y install emacs-snapshot
...

###############################################################################
# start this up
###############################################################################
initialize($emacs_conf);

__END__

No futher.
