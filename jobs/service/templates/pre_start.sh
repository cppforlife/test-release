#!/bin/bash

echo <%= p("simple_server.pre_start.stdout") %>
echo <%= p("simple_server.pre_start.stderr") %> 1>&2
sleep <%= p("simple_server.pre_start.delay_secs") %>
exit <%= p("simple_server.pre_start.exit_code") %>
