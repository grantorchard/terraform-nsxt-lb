resource "nsxt_policy_lb_pool" "this" {
  display_name         = "test"
  description          = "Terraform provisioned LB Pool"
  algorithm            = "IP_HASH"
  min_active_members   = 2
  #active_monitor_path  = "/infra/lb-monitor-profiles/default-icmp-lb-monitor"
  #passive_monitor_path = "/infra/lb-monitor-profiles/default-passive-lb-monitor"
  
	member_group {
		group_path = var.nsx_group_path
	}

  snat {
    type = "AUTOMAP"
  }
  tcp_multiplexing_enabled = true
  tcp_multiplexing_number  = 8
}


# resource "nsxt_policy_lb_service" "test" {
#   display_name      = "test"
#   description       = "Terraform provisioned Service"
#   connectivity_path = data.nsxt_policy_tier1_gateway.test.path
#   size              = "SMALL"
#   enabled           = true
#   error_log_level   = "ERROR"
#   depends_on        = [nsxt_policy_tier1_gateway_interface.tier1_gateway_interface]
# }