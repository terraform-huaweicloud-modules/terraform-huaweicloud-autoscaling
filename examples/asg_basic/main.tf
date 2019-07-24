provider "flexibleengine" {
  access_key = "AK"
  secret_key = "SK"
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
  region = "eu-west-0"
  tenant_name = "eu-west-0"
}

data "flexibleengine_networking_secgroup_v2" "default" {
  name = "default"
}

module "example" {
  source ="../.."

  configuration_name = "testASConfig"
  instance_id        = "2c31a1d8-80db-49bc-a3b1-8db55bdc0e60"
  key_name           = "KeyPair"
  group_name         = "testASGroup"
  availability_zones = ["eu-west-0a", "eu-west-0b"]
  network_id         = "55534eaa-533a-419d-9b40-ec427ea7195a"
  security_group     = "${data.flexibleengine_networking_secgroup_v2.default.id}"
  vpc_id             = "8eed4fc7-e5e5-44a2-b5f2-23b3e5d46235" 
}
