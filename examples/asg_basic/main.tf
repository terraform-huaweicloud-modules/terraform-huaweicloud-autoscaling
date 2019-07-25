provider "huaweicloud" {
  access_key  = "AK"
  secret_key  = "SK"
  auth_url    = "https://iam.cn-north-1.myhwclouds.com:443/v3"
  region      = "cn-north-1"
  tenant_name = "cn-north-1"
}

data "huaweicloud_networking_secgroup_v2" "default" {
  name = "default"
}

module "example" {
  source ="../.."

  configuration_name = "testASConfig"
  instance_id        = "2c31a1d8-80db-49bc-a3b1-8db55bdc0e60"
  key_name           = "KeyPair"
  group_name         = "testASGroup"
  availability_zones = ["cn-north-1a", "cn-north-1b"]
  network_id         = "55534eaa-533a-419d-9b40-ec427ea7195a"
  security_group     = "${data.huaweicloud_networking_secgroup_v2.default.id}"
  vpc_id             = "8eed4fc7-e5e5-44a2-b5f2-23b3e5d46235" 
}
