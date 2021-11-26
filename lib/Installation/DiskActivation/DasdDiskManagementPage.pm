# SUSE's openQA tests
#
# Copyright 2021 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: Handles DASD Disk Management page
# Maintainer: QE YaST <qa-sle-yast@suse.de>

package Installation::DiskActivation::DasdDiskManagementPage;
use parent 'Installation::Navigation::NavigationBase';
use strict;
use warnings;

sub init {
    my ($self) = @_;
    $self->SUPER::init();
    $self->{tb_minimum_channel} = $self->{app}->textbox({id => 'min_chan'});
    $self->{tb_maximum_channel} = $self->{app}->textbox({id => 'max_chan'});
    $self->{btn_filter} = $self->{app}->button({id => 'filter'});
    $self->{tbl_channels} = $self->{app}->table({id => 'table'});
    $self->{menu_operation} = $self->{app}->menucollection({id => 'operation'});
    return $self;
}

sub enter_minimum_channel {
    my ($self, $minimum_channel) = @_;
    return $self->{tb_minimum_channel}->set($minimum_channel);

}

sub enter_maximum_channel {
    my ($self, $maximum_channel) = @_;
    return $self->{tb_maximum_channel}->set($maximum_channel);
}

sub press_filter_button {
    my ($self) = @_;
    return $self->{btn_filter}->click();
}

sub get_channels {
    my ($self) = @_;
    return $self->{tbl_channels}->items();
}

sub select_channel {
    my ($self, $channel) = @_;
    return $self->{tbl_channels}->select(value => $channel);
}

sub perform_activate_action {
    my ($self) = @_;
    $self->{menu_operation}->select('Activate');
}

sub is_shown {
    my ($self) = @_;
    return $self->{tb_minimum_channel}->exist();
}

1;
