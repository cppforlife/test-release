#!/bin/bash

echo <%= p("service.pre_start.stdout") %>
echo <%= p("service.pre_start.stderr") %> 1>&2
sleep <%= p("service.pre_start.delay_secs") %>
exit <%= p("service.pre_start.exit_code") %>
