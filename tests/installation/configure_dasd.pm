# SUSE's openQA tests
#
# Copyright 2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: Activates multipath when multipath activation message appears
# Maintainer: QE YaST <qa-sle-yast@suse.de>

use parent 'y2_installbase';
use testapi;
use strict;
use warnings;

sub run {
    my $dasd_channel = "0.0.0150";

    my $disk_activation_controller = $testapi::distri->get_disk_activation();
    $disk_activation_controller->configure_dasd_disks();
    my $dasd_disk_management_controller = $testapi::distri->get_dasd_disk_management();
    $dasd_disk_management_controller->filter_channel($dasd_channel);
    $dasd_disk_management_controller->activate_channel($dasd_channel);
    $dasd_disk_management_controller->accept_configuration();
    $disk_activation_controller->accept_disks_configuration();
}

1;
