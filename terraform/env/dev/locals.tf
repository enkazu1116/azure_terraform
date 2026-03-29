locals {
    ssh_rule_name = "allow_ssh"
    ssh_rule_priority = 100
    ssh_rule_direction = "Inbound"
    ssh_rule_access = "Allow"
    ssh_rule_protcol = "Tcp"
    ssh_rule_source_port_range = "*"
    ssh_rule_destination_port_range = "22"
    ssh_rule_source_address_prefix = "*"
    ssh_rule_destination_address_prefix = "*"
}