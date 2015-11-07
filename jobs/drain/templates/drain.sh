#!/bin/bash

echo <%= p("drain.stdout") %>
echo <%= p("drain.stderr") %> 1>&2
sleep <%= p("drain.delay_secs") %>
exit <%= p("drain.exit_code") %>
