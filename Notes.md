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






