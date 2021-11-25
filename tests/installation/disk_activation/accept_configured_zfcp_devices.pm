# SUSE's openQA tests
#
# Copyright 2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: This test module handles ZFCP disk activation
#          through libyui-rest-client.

# Maintainer: QE YaST <qa-sle-yast@suse.de>

use strict;
use warnings;
use base 'y2_installbase';
use YuiRestClient::Logger;

sub run {
    my $zfcp_configuration_overview = $testapi::distri->get_configured_zfcp_devices();
    $zfcp_configuration_overview->accept_devices();
}

1;
