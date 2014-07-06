#!/usr/bin/env perl
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

use strict;
use warnings;

use qpid_proton;

sub usage {
    exit(0);
}

my @addresses = @ARGV;
@addresses = ("~0.0.0.0") unless $addresses[0];

my $messenger = new qpid::proton::Messenger();
my $msg = new qpid::proton::Message();

$messenger->start();

foreach (@addresses)
{
    print "Subscribing to $_\n";
    $messenger->subscribe($_);
}

for(;;)
{
    $messenger->receive(10);

    while ($messenger->incoming() > 0)
    {
        $messenger->get($msg);
        print "Address: " . $msg->get_address() . "\n";
        print "Subject: " . $msg->get_subject() . "\n";
        print "Content: " . $msg->get_content() . "\n";
        print "Body:    " . $msg->get_body() . "\n";
        print "Properties:\n";
        my $props = $msg->get_properties();
        foreach (keys $props) {
            print "\t$_=$props->{$_}\n";
        }
        print "Instructions:\n";
        my $instructions = $msg->get_instructions;
        foreach (keys $instructions) {
            print "\t$_=" . $instructions->{$_} . "\n";
        }
        print "Annotations:\n";
        my $annotations = $msg->get_annotations();
        foreach (keys $annotations) {
            print "\t$_=" . $annotations->{$_} . "\n";
        }
    }
}

die $@ if ($@);
