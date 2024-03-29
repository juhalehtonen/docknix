# This file contains all the variables you should typically need to adjust when deciding
# what kind of setup you want to end up with. Read the comments here carefully.

# Droplet variables
# Docs: https://www.terraform.io/docs/providers/do/r/droplet.html
droplet_name = "docknix"
droplet_image = "ubuntu-16-04-x64"
droplet_region = "ams3"
droplet_size = "s-1vcpu-1gb"
droplet_count = 1
droplet_backups = false

# Domain vars, No domain work is done if `create_domain` is `false`
create_domain = true
domain_name = "elixir.observer"
create_record = true

# NOTE: You cannot assign floating IPs to load balancers currently, no reason
# to create both now

# Load Balancer vars, no load balancer is created if `create_load_balancer`
# is `false`
create_load_balancer = false
load_balancer_protocol = "http"
# Floating IP vars, no floating IP is created if `create_floating_ip` is
# `false`
create_floating_ip = false

# Bash scripts
scripts_to_run = ["scripts/update.sh", "scripts/users.sh", "scripts/docker.sh", "scripts/ufw.sh", "scripts/ssh.sh"]
