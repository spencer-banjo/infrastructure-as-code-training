# standard vars
team_name               = "intel"
region                  = "us-west-2"

# EC2 instance vars
key_name                = "intel-sandbox-shared"
subnet_name             = "sandbox-shared-public-0" # existing public subnet for sandbox (shared)
security_group_name     = "launch-wizard-3"
instance_type           = "g4dn.xlarge"
ami                     = "ami-02caf1b6cdf1763ee"   # NVIDIA Deep Learning AMI (Ubuntu 18.04)
root_device_volume_size = 180                       # GiBs
