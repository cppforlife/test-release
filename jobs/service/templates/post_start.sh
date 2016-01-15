#!/bin/bash

echo <%= p("service.post_start.stdout") %>
echo <%= p("service.post_start.stderr") %> 1>&2
sleep <%= p("service.post_start.delay_secs") %>
exit <%= p("service.post_start.exit_code") %>
