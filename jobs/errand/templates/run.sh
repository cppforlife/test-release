#!/bin/bash

echo <%= p("errand.stdout") %>
echo <%= p("errand.stderr") %> 1>&2
sleep <%= p("errand.delay_secs") %>
exit <%= p("errand.exit_code") %>
