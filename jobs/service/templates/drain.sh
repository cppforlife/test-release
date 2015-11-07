#!/bin/bash

echo <%= p("service.drain.stderr") %> 1>&2
sleep <%= p("service.drain.delay_secs") %>
echo <%= p("service.drain.echoed_status") %>
exit <%= p("service.drain.exit_code") %>
