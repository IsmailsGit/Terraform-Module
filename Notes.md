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

# Terraform State File 
Terraform state file is actually a record of your existing infrastructure. It's an up-to-date record of your actual state.

This is really important and it helps ensure idempotency.
<br> Idempotency means your Terraform configuration, no matter how many times you run it, will produce the same result. It wouldn't deploy things multiple times and the result will be the same. And if you make a particular change to your configuration, it wouldn't cause a complete change, it will just apply that particular change. 


Desired vs Current state

<img width="595" height="343" alt="image" src="https://github.com/user-attachments/assets/a327b324-5d31-4fed-944d-ad1eec93403b" />


Terraform state file is an up-to-date record of your infrastructure. So, that is your current state. For example, if you deployed two EC2 instances, all the details about those resources should be in your Terraform state file.

Now, your desired state, this .tf, is actually your Terraform configuration of maybe changes you're trying to implement or things you're trying to deploy.

What does the Terraform state file do? 
It compares this to your actual infrastructure. And that's how Terraform is able to decide on what to do. 

Desired state is what you're trying to achieve. Current state is what actually exists.

## Deploying Infrastructure

How is infrastructure deployed via terraform?
How are the connections established for your deployments?
How do I make sure I deploy things safely and not break anything?

### Terraform Providers
How are the connections established for your deployments?

A terraform provider is a plugin that allows you to interact with cloud platforms, services or technologies, it's what enables terraform to manage your resources in the cloud.

AWS example as a Provider

<img width="511" height="323" alt="image" src="https://github.com/user-attachments/assets/ee032fce-f847-49b7-9605-fdf065a57fb9" />

You have this Terraform block and you have this provider block. 

The required providers tells you which provider is being used and what your terraform code depends on. In this code it's aws.

The source tells you the source of the provider, it's often formatted as namespace then provider. The namespace is your official hashicorp it's reiterating that you're getting the AWS provider from the official HashiCorp registry.

The version tells you the version of your provider

You have the Provider which is the keyword it indicates what you're trying to configure via Terraform. And then you have the provider name, which is AWS. 
This block is telling terraform that you're trying to configure the aws provider 


### Terraform init

<img width="612" height="308" alt="image" src="https://github.com/user-attachments/assets/86aa2cd1-f9a1-4eae-add2-3399de9bb9ad" />

Terraform init is actually the first command you run in any new or existing Terraform project. Think of it as setting up your workspace.

Terraform innit initializes the backend. 
<br> What does that mean? 
<br> The backend is where Terraform stores the state of your infrastructure. 

This can be stored in a local file on your machine, or it can be stored remotely in a storage space like S3. So Terraform can now track your resources properly and allow that idempotency.

Terraform init is also used to download your provider. Terraform looks at your configuration to identify which providers you need. And then it downloads these providers from the Terraform registry or other sources.

### Terraform plan
Terraform plan allows you to see what your changes will do.

Terraform analyzes your configuration files, compares them to the current state of your infrastructure, and then generates a plan to see what changes need to be made in order to achieve your desired state.

The output of running "Terraform plan" represents our desired state

Resource actions are indicated with the following symbols :
<br> + create: Resources that will be created.
<br> ~ update in-place: Resources that will be modified.
<br> - destroy: Resources that will be deleted

Example

<img width="382" height="536" alt="image" src="https://github.com/user-attachments/assets/3fb2796a-4c88-4bd7-9c87-1f8dde20d9cc" />

Terraform will perform the following actions:
<br> • An EC2 instance (aws_instance.example) will be created.
<br> • A security group (aws_security_group.example) will have some properties updated.
<br> • An S3 bucket (aws_s3_bucket.example) will be destroyed.

### Terraform apply
Terraform apply takes the execution plan, which is generated by a Terraform plan, and applies it to your infrastructure. This means that any resources that Terraform plans to create, update, or destroy will actually be implemented when you run the apply command.



Example

<img width="288" height="421" alt="image" src="https://github.com/user-attachments/assets/a47d81e3-1cae-4444-aae6-defcc668c5f4" />

In this example terrafrom will be 
<br> • aws_instance.example: Creating
<br> • aws_security_group.example: Modifying
<br> • aws_s3_bucket.example: Destroying

After these changes are made, Terraform will update the state file to reflect the current state of your infrastructure again, in order to maintain idempotency. 

This is important because the state file is what Terraform tracks. It identifies what resources it manages and their configurations.

### Terraform destroy

Terraform destroy command is a way to destroy all remote objects managed by a particular terraform configuration.

It is the opposite of a terraform apply, it's designed to destroy everything terraform has created 

What happens during Terraform destroy
It reads your configuration and state file. Terraform first reads your current configuration and state file to understand what resource it is managing.

Then similarly to plan it actually generates a destruction plan. But this time, the plan details what resources to actually destroy rather than your Terraform plan that can detail what resources to create.

Terraform will actually prompt you to confirm before proceeding with the destruction. This is an important feature. Same way that Terraform will prompt you when doing an apply, this is a safety measure to prevent you accidentally deleting things. 

Once you confirm, Terraform sends the necessary commands to the cloud provider in order to destroy your resources. And then finally, Terraform updates the state file to reflect that the resources have been destroyed, ensuring that the state file remains accurate and up to date.

### Resource Block
Configuring a Resource Block

In Terraform, a resource block is used to define a piece of infrastructure that you want to manage. Whether it's a virtual machine, in this case, like an EC2 instance, or a database or networking components.

The resource block is where you specify what you want to create, update, or delete about that resource. Each resource block corresponds to a specific resource type provided by the Terraform provider you're using, in this example it's aws

<img width="689" height="359" alt="image" src="https://github.com/user-attachments/assets/6882613a-a6c4-4664-b717-ab6238eb133a" />

Resource "aws_instance" "Test" - This line defines the resource type which is aws_instance and test is the name of your resource

Attributes inside the Resource Block

The ami attribute specifies the Amazon machine image, which is the template for your ec2 instance, determining the operating system.

The instance_type is t2micro, this determines the hardware configuration of your instance, things like the CPU and memory 

The tags attribute is a way to label and categorise your resources. It isn't compulsory but it's good practice for a production environment as you'd often want to know what sort of environment you're deploying your resources into, might be configured with things such as dev or prod or staging, depending on the environment that you're deploying your resource into.

### Terraform Import
Terraform import is a command that allows you to take existing resources into your cloud environment. This command is essential when you want to integrate Terraform into an existing infrastructure setup without needing to recreate anything from scratch.

Why is this important?
<br> You might join a company that already has resources deployed to the cloud manually, and you want to implement best practices and infrastructure as code.

It'll be a pain having to delete all these resources and manually recreate them all from scratch. Terraform import is what allows you to bring those resources you created manually into your Terraform environment.

Import Block

<img width="819" height="430" alt="image" src="https://github.com/user-attachments/assets/c5da6085-0ac4-4802-8290-d5b9db56f218" />

Once you run a terrafrom plan you want to ensure that the resources you imported and the resource block that you've configured for it matches your current infrastructure.

Your desired state should match your current state when you're importing a resource. So there should be a final confirmation of no changes to your infrastructure.

## Local and Remote Statefiles

### Local Statefiles

Terraform stores your state file locally on your machine right in your project directory.

Local Statefile characteristics

1. It's easy to set up and there's no additional configuration required to store your state file locally.

2. It's ideal for single-user projects, which is what we were previously working on when we deployed our EC2 instance. Local state files are best suited for environments where only one person is managing the infrastructure. It keeps everything contained and simple.

### Remote Statefiles
Remote Statefile characteristics

1. By storing the state file remotely, multiple team members can access and update the same infrastructure state without risking conflicts or inconsistencies.

2. Automatic locking, many remote backends like AWS S3, Terraform Cloud offer state locking. This helps prevent users from making changes at the same time, which reduces the risk of state corruption.

3. Automatic backups and security. Remote backends can automatically back up your state file and apply encryption, ensuring that your infrastructure state is both secure and recoverable.
 
## Terraform Workflow
### Terraform init
Terraform init is used to initialize a working directory containing your Terraform config files. This is the first command that should be run after writing a new Terraform configuration, and it downloads providers. Remember that it configures the backend for your Terraform state file.

<br>        ⬇
### Terraform validate
It validates the Terraform configuration files in that respective directory to check if your code is well-formed, spotting those early syntax errors before you move on to other steps.
<br>        ⬇
 ### Terraform plan
 It creates an execution plan. Terraform plan is comparing your current state to the desired state, which is your Terraform configuration files and what you want to achieve. And it tells you the necessary actions that need to occur in order to achieve your desired state.
<br>        ⬇
### Terraform Apply
It's the execution that helps you achieve your desired state.
Used to apply the changes required to reach the desired state of the configuration. So by default, apply scans the current directory for the configuration files and applies the changes appropriately. It also generates a plan and gives you that prompt back asking you, are you sure you want to apply these changes? 
<br>        ⬇
### Terraform Destroy
Destroy is used to destroy the Terraform-managed infrastructure. And it will give you that same prompt back and ask for confirmation before destroying. it's a simple way to tear down your infrastructure without having to manually destroy all those resources.
















