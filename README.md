# pnh

1. Setup AWS ACC
2. Put credentials to `~/.aws/credentials`
```
[user1]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```
3. Download Terraform - https://www.terraform.io/downloads
4. Specify your profile (`user1`) to terraform profile variable `ireland.tfvars`
4. Replace `URL_HERE` in `user_data.sh` with needed URL - https://example.com
```
terraform init
terraform apply -var-file ireland.tfvars
```
