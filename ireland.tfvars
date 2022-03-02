// Set-up main info
region = "eu-west-1"
ami_id = "ami-0bf84c42e04519c85"
profile = "personal"

// Set-up Auto Scaling Group
asg_name = "on-demand"
desired_capacity = 1
min_size = 0
max_size = 5


// Set-up launch configuration
lc_name = "on-demand"
