#!/bin/bash

echo <%= p("post_start.stdout") %>
echo <%= p("post_start.stderr") %> 1>&2
sleep <%= p("post_start.delay_secs") %>
exit <%= p("post_start.exit_code") %>
