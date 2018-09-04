# SUSE's openQA tests
#
# Copyright © 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: QAM regression testing
# Maintainer: Orestis Nalmpantis <onalmpantis@suse.de>

use base "consoletest";
use strict;
use testapi;
use utils 'zypper_call';

sub run {
    select_console 'root-console';
    zypper_call 'in ca-certificates-mozilla openssl';
    assert_script_run('echo "x" | openssl s_client -connect www.nasa.gov:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.fbi.gov:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.entrust.com:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.suse.com:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.csas.cz:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.amazon.com:443 | grep "Verify return code: 0"');
    assert_script_run('echo "x" | openssl s_client -connect www.commerzbank.com:443 | grep "Verify return code: 0"');
}

1;
