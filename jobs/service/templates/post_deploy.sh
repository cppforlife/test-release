#!/bin/bash

echo <%= p("service.post_deploy.stdout") %>
echo <%= p("service.post_deploy.stderr") %> 1>&2
sleep <%= p("service.post_deploy.delay_secs") %>
exit <%= p("service.post_deploy.exit_code") %>
