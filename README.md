# Simple-Resume, a Jekyll Theme

A first take at making a Jekyll theme.

# To develop this theme

## Windows 10

There are many ways to get your development environment up to snuff... I use a combination of PowerShell, and the Linux Subsystem:

Step 1: Enable WSL

```PowerShell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Step 2: Install your flavor of Linux, I chose Ubuntu

Step 3: Install the tools (I may rewrite this to use `Snap` instead of `apt`)

```bash
sudo apt update && \
sudo apt-get install ruby-full && \
sudo apt-get ruby-dev && \
gem install jekyll
```