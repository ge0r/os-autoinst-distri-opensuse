# SUSE's openQA tests
#
# Copyright © 2021 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
#
# Summary: Web browser UI test for rancher container
# Maintainer: Ivan Lausuch <ilausuch@suse.com>

use base 'x11test';
use strict;
use warnings;
use testapi;
use utils;
use x11utils 'ensure_unlocked_desktop';

sub run {
    my ($self) = @_;
    $self->select_serial_terminal;
    
    assert_script_run("wget https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-linux64.tar.gz");
    assert_script_run("tar -xf geckodriver-v0.29.0-linux64.tar.gz");
    assert_script_run("mv geckodriver /opt/geckodriver");
    assert_script_run("ln -s /opt/geckodriver /usr/local/bin/geckodriver");

    assert_script_run("pip3 install selenium");
    assert_script_run('curl -O ' . data_url("rancher/ui_test.py"), timeout => 300);    
    assert_script_run('mv ui_test.py /home/bernhard/');
    assert_script_run('ls /home/bernhard/');
    
    select_console 'x11';
    ensure_unlocked_desktop;

	x11_start_program('python3 ui_test.py');

    #x11_start_program('xterm');
    #type_string "python3 ui_test.py && touch /tmp/ok\n";
    #assert_script_run("[ -f /tmp/ok ]");
}

1;

