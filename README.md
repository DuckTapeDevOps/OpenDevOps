# FRODO
For Real, Open DevOps! This repo is an attempt at creating Terraform modules that are repeatable and industry standard. There are a finite number of infrastructure architectures that a user may build. Most of these components are established, but there are not simplified modules that are easily undestood and quickly spun up. This repo hopes to solve that issue.


![Alt Text](./media/images/real-mvp.gif)

MVP: Minimal Viable Product

The MVP for this project is a scalable Python FastAPI that returns hello world and can be spun up and down with minimal variables changed in a single HCL file and run with a simple MAKE command.


![Alt Text](./media/diagrams/mvp.png)


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

