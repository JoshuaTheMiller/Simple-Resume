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

* From the horses mouth: https://jekyllrb.com/docs/installation/ubuntu/

First, run

```bash
sudo apt-get install ruby-full build-essential zlib1g-dev git
```

Then,

```bash
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Then,

```bash
gem install jekyll bundler github-pages
```

### To Run

As there are some issues running Jekyll on Windows (at the time of writing), I use the following command:

`bundle exec jekyll _3.8.6_ serve --no-watch --trace --incremental`

Additionally, I have found that periodically cleaning helps...

`bundle exec jekyll clean`