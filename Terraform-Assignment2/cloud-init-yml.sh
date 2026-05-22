#cloud-config
# This tells the instance to interpret this user data as a cloud-init configuration file.

packages: #defines software packages cloud-init should install, and the - indicates an item in a YAML list.
  - httpd # Apache web server package
  - wget  # Tool used to download files from the internet
  - php  # Scripting language required for dynamic web applications like WordPress

runcmd: #Commands cloud-init should execute during setup.
  - systemctl enable httpd #ensures Apache automatically starts on future boots/reboots
  - systemctl start httpd #starts Apache immediately during setup

write_files: #creates or overwrites files on the instance
  - path: /var/www/html/index.html #defines the file location
    content: | #writes multi-line content into the file .The | symbol tells YAML to preserve multi-line formatting exactly as written, which is important for structured content like HTML. Without |, YAML may not preserve multi-line formatting, which could break structured content like HTML or configuration files
      <h1>Cloud-Init Deployment Successful</h1>