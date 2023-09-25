# FRODO
For Real, Open DevOps! This repo is an attempt at creating Terraform modules that are repeatable and industry standard. There are a finite number of infrastructure architectures that a user may build. Most of these components are established, but there are not simplified modules that are easily undestood and quickly spun up. This repo hopes to solve that issue.


![Alt Text](./media/images/real-mvp.gif)

MVP: Minimal Viable Product

The MVP for this project is a scalable Python FastAPI that returns hello world and can be spun up and down with minimal variables changed in a single HCL file and run with a simple MAKE command.


![Alt Text](./media/diagrams/mvp.png)


## Walkthrough

- First we'll need to run [s3_backend](./InfrastructureAsCode/terraform/s3_backend/) in order to create an s3 backend for our .tfstate files so they are not stored locally. Within this bucket, you'll want to create a folder sctructure to match your environments.

- In order to ensure that we do not delete our ACM certificates as well as our route53 domain names, we create those manually  via a separate Terraform module in the [domain](./InfrastructureAsCode/terraform/domain/) subfolder. Once the ACM and Route53 components have been created, it can take up to 30 minutes for the DNS to propogate.


## Tech Stack (Needs)

![Alt Text](./media/images/surprise-whats-in-the-box.gif)

- Docker
- Python
- FastAPI
- Terraform
- AWS
  - Lambda
  - ECS
    - Fargate
  - ECR
    - Public and Private Docker Repos
  - API Gateway
    - Lambda Authorizer
  - Load Balancing
    - Network Load Balancer
    - SSL Termination
  - Route53, VPC, Subnets

------

## Brain Dump (Wants)

![Alt Text](./media/images/ThisIsFine.jpeg)

- S3 Front End
- CloudFront
- Website


## Backlog

- Discord Bot
- Twitch Bot

---
![Alt Text](./media/images/dumpsterfire-dumpster.gif)

