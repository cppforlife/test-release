#!/bin/bash

echo <%= p("simple_server.drain.stdout") %>
echo <%= p("simple_server.drain.stderr") %> 1>&2
sleep <%= p("simple_server.drain.delay_secs") %>
exit <%= p("simple_server.drain.exit_code") %>
