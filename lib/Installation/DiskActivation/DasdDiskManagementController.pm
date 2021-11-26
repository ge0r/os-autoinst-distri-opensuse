# SUSE's openQA tests
#
# Copyright 2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: This class introduces business actions for Dasd Disk Management page
# Maintainer: QE YaST <qa-sle-yast@suse.de>

package Installation::DiskActivation::DasdDiskManagementController;
use strict;
use warnings;
use Installation::DiskActivation::DasdDiskManagementPage;
use YuiRestClient;

sub new {
    my ($class, $args) = @_;
    my $self = bless {}, $class;
    return $self->init($args);
}

sub init {
    my ($self, $args) = @_;
    $self->{DasdDiskManagementPage} = Installation::DiskActivation::DasdDiskManagementPage->new({app => YuiRestClient::get_app()});
    return $self;
}

sub get_dasd_disk_management_page {
    my ($self) = @_;
    die "DASD Disk Management page is not displayed" unless $self->{DasdDiskManagementPage}->is_shown();
    return $self->{DasdDiskManagementPage};
}

sub filter_channel {
    my ($self, $channel) = @_;
    $self->get_dasd_disk_management_page()->enter_minimum_channel($channel);
    $self->get_dasd_disk_management_page()->enter_maximum_channel($channel);
    $self->get_dasd_disk_management_page()->press_filter_button();
}

sub activate_channel {
    my ($self, $channel) = @_;
    $self->get_dasd_disk_management_page()->select_channel($channel);
    $self->get_dasd_disk_management_page()->perform_activate_action();
}

sub accept_configuration {
    my ($self) = @_;
    $self->get_dasd_disk_management_page()->press_next();
}

1;
