#!/bin/bash


echo <%= p("pre_start.stdout") %>
echo <%= p("pre_start.stderr") %> 1>&2
sleep <%= p("pre_start.delay_secs") %>

if [ -f /tmp/pre-start-exit-code ]; then
	exit `cat /tmp/pre-start-exit-code`
fi

exit <%= p("pre_start.exit_code") %>
