#!/bin/bash

echo <%= p("post_deploy.stdout") %>
echo <%= p("post_deploy.stderr") %> 1>&2
sleep <%= p("post_deploy.delay_secs") %>
exit <%= p("post_deploy.exit_code") %>
