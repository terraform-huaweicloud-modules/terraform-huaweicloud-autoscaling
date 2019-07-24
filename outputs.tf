output "this_as_configuration_id" {
  description = "The id of the autoscaling configuration"
  value       = "${var.as_config_id=="" ? join("",flexibleengine_as_configuration_v1.this.*.id) : var.as_config_id}"
} 

output "this_as_group_id" {
  description = "The id of the autoscaling group"
  value       = "${flexibleengine_as_group_v1.this.id}"
} 
