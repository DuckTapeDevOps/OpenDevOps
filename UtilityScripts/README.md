## transfer_aws_domain.py

In this script you can move a domain from one AWS account to another by setting two different profiles for your source and destination AWS accounts. In my example, I'm moving ballsoffwalls.com from "default" to "DuckTapeDevOps" account.

## create_acm.py

In this script you can create the ACM certificate for your domain as a wildcard. This is external to the Terraform because ACM mTLS certificates should be external to the product you're building such that you can freely delete and rebuild your environments as needed.

Before the Amazon certificate authority (CA) can issue a certificate for your site, AWS Certificate Manager (ACM) must prove that you own or control all of the domain names that you specify in your request. You can choose to prove your ownership with either Domain Name System (DNS) validation or with email validation at the time you request a certificate. Validation applies only to publicly trusted certificates issued by ACM. ACM does not validate domain ownership for imported certificates or for certificates signed by a private CA.