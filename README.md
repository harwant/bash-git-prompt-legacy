# Informative Git Prommpt for Legacy systems

## History:

I simply love and use `https://github.com/magicmonty/bash-git-prompt` whenever
it works.

But a few times I ran into *legacy* servers that were pretty well locked down to 
be able to use the above. It just did not work. Even git is not latest on these servers. But after using
*bash-git-prompt* for sometime, I find it almost impossible living without it.

So, after some help from Google and wonderful people who share tons of information on the web,
I came up with my own simple and minimalist Git prompt that works on these legacy server
and keeps me out of trouble from situations like - which branch am I using right now? did I
make local mods that I forgot about? etc. etc.

Anyhow, I thought I put it out on GitHub.com because other might benefit from it.

## Compatibility List

Please let me know where you are able to successfully use it. I know that I had to make a
few tweaks to make it work on our RedHat servers. With your help we can make a running list
and also tweak it further to make it work on additional systems.

* RedHatEnterpriseServer Release 6.8 / git version 1.7.1


## Installation

```sh
cd ~
git clone https://github.com/harwant/bash-git-prompt-legacy.git .bash-git-prompt-legacy --depth=1
```

Add to the `~/.bashrc`:
```
# Git prompt
if [[ "~/.bash-git-prompt-legacy/gitprompt.sh" ]]; then

   # Set config variables first

   # I use different colors for production vs. developement hostnames
   # e.g. COLOR_RED for production server hostname, COLOR_YELLOW for development and COLOR_GREEN for local
   # Default hostname color is white
   GITPROMPT_HOSTNAME_COLOR='COLOR_YELLOW'

   source ~/.bash-git-prompt-legacy/gitprompt.sh
fi
```
