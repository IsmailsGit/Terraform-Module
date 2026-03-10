# Introduction to Terraform

Terraform is one of the most in-demand tools for DevOps engineers and it's often the backbone to a lot of infrastructure deployments, whether that is deploying things in AWS or deploying things in Microsoft Azure. Terraform is often the go-to tool for infrastructure as code.

## What is IaC (Infrastructure as code)
Terraform is a tool that you utilize in order to deploy those resources that you did manually in the cloud in the form of code.

The benefit of this is it's easy to replicate and it's easy to scale.
<br> Having to do things manually can be tedious in the cloud. There's more room for error. It is hard to see what will happen when you deploy things. And this is the benefit of using Terraform as an infrastructure as code tool.

IaC in a production environment would look like this 
<img width="690" height="322" alt="image" src="https://github.com/user-attachments/assets/79dc133b-d344-4e4f-81c2-4e567feb166d" />

An individual writing scripts and templates and writing it in terraform -> then deploying their code to aws, microsoft azure and google cloud platform.

How can Terraform deploy to different cloud provider? 
<br> Terraform is a cloud-agnostic tool which means it can deploy to any cloud and different providers. It can also deploy kubernetes resources.

It does this through the Terraform registry where it will install certain plugins, it will use certain API calls in order to be able to deploy to different providers. And in this case, we will be focusing on what that looks like when deploying things to AWS Cloud.

### IaC with Version control
Infrastructure as code can be stored in version control systems such as Git. This allows you to track your changes, roll back to certain versions, and also collaborate amongst team members.

In a production environment, that would often look like members in your team deploying to the same infrastructure, each pushing different bits of code, and that is often managed by the Terraform state file and the Terraform lock file.

## Infrastructure Orchestration vs Config Management

<img width="600" height="353" alt="image" src="https://github.com/user-attachments/assets/22554853-e428-49f6-a02a-98b4f35ff088" />

A simple analogy 
<br> Millions of Muslims annually attend a very important pilgrimage known as Hajj. 
Now, what would that look like in terms of infrastructure orchestration?
It would be arranging the essentials such as the transportation for the pilgrimage, hotels, the tents required, and this will be arranged in a very particular order. That would be the orchestration.

What would the config management look like?
<br> You'd have to consider each individual pilgrim and exactly what they need in order to perform the pilgrimage, such as the correct clothing, prayer mats, and any other utilities they might need, and that will fall over the config management of things.

Within the DevOps space
<br> Using  terraform as an orchestration tool that will be used in order to deploy your servers such as EC2 instances.

Config management tool
<br> You could use something like Ansible, for example, in which you'll be configuring your EC2 instances and these servers in order to run certain things such as hosting a WordPress server

I’ll be deploying that via Terraform, and  using Ansible to actually configure your WordPress instance.

Infrastructure Orchestration (Terraform’s main role):
<br> Creates infrastructure resources
<br> Handles dependencies
<br> Builds cloud environments

Examples:
<br> Create a VPC
<br> Launch a VM
<br> Attach a load balancer
<br> Create subnets

Configuration Management:
<br> Configures what happens inside a server
<br> Installs software
<br> Manages packages and services

Examples:
<br> Install Docker
<br> Install Nginx
<br> Create Linux users
<br> Modify config files

Summary
<br> Infrastructure Orchestration creates the infrastructure and Configuration Management configures the inside of the server e.g. installs software and manages packages and services.

### What is Terraform
<img width="651" height="347" alt="image" src="https://github.com/user-attachments/assets/cdb5dd0d-acf5-4fca-8953-2dcacd9eabfa" />

You're a practitioner and you're deciding to deploy certain things using Terraform. That is your infrastructure as code tool.

And then you've run a plan. Your plan is telling you exactly what your code is trying to do. So it will have things such as the resources you're trying to create. If this code is suggesting to deploy an EC2 instance, then your plan will tell you that it wants to create that.

If you're happy with this plan and it correlates exactly with what you think your code is meant to do, you will then apply this. It will be a simple apply and it will run exactly what you need in order to then deploy your resources into the cloud

This process involves the creation, the updating of these resources, and the versioning.

### Tips for using Terraform

1. Use the Terraform Documentation so the official hashicorp documentation for Terraform. And the Terraform registry

2. Testing and Validation - it is important to know the implications of your code. In a production environment, you don't want to be breaking anything. You don't want to be deleting any important resources that are being used or anything live. So it's important to test and validate these things. This comes through thoroughly checking your Terraform plan and thoroughly making sure that it aligns with what you're trying to deploy.

3. Start with a small MVP(Minimum Viable Product) and then iterate -  What that means in Terraform is configuring the resource that you need in order to deploy it into the cloud and then you could iterate. By iterating, we could focus on implementing maybe variables, maybe turning your code into a Terraform module. These are all things that you could iterate later on, but when undergoing your learning journey, it's important to establish an MVP and iterate accordingly.

4. Implement DRY software engineering principle - DRY means do not repeat yourself. This is particularly important when it comes to Terraform. With Terraform, you have modules, things that can be used as templates. So often the best Terraform code will be the code that isn't constantly repeated. So utilizing things like modules and making your Terraform as DRY as possible is the ultimate goal in which you want to achieve.



