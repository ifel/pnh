# pnh

1. Setup AWS ACC
2. Create IAM user with Administrator privileges
<img width="1772" alt="image" src="https://user-images.githubusercontent.com/48525503/156635062-9b495902-976c-4aa0-8076-2eb3d00b36cc.png">

3. Put this user credentials to `~/.aws/credentials` on your laptop
```
[user1]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```
3. Download Terraform - https://www.terraform.io/downloads
4. Clone this repo
```
git clone https://github.com/nomatterz/pnh
cd pnh
```
5. Specify your profile (`user1`) to terraform `profile` variable in `ireland.tfvars` - this variable file has region set `eu-west-1` - that's Ireland.  
or create your own `*.tfvars` file 
6. Adjust ddoser launch cmd if needed in `user_data_ddoser.sh`
7. `desired_capacity` variable in `ireland.tfvars` or in any other var file ( `myfile.tfvars` for example)  - how many instances to launch
8. Run
```
terraform init
terraform apply -var-file myfile.tfvars 
```
9. To launch instances in another region create `*.tfvars` file with needed values (available regions can be found here - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html - `us-east-1`, `eu-central-1`, etc
10. To destroy AWS resources
```
terraform destroy -var-file myfile.tfvars
```
