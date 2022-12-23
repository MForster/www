---
title: Hosting my own Mastodon instance
date: 2022-12-06

tags: [Mastodon, NixOS, System Administration]
categories: [Blog]

links:
  - icon_pack: fab
    icon: mastodon
    name: Discuss
    url: https://forster.pro/@michael/109468002025514664
---

Here are a few thoughts about self-hosting my own
[Mastodon](https://joinmastodon.org/) instance, why I do it, how I do it, and
how it is going.

Spoiler: It's not hard, and I like it so far.

(After saying that, I'll probably soon run into hard issues 😀)

## Why did I want to host my own instance?

There isn't actually a strong reason. Part of it was just the nerd in me wanting
to try it out, but then it also seemed to be an answer to my
choose-the-right-instance conundrum.

There are many nice instances that would probably have easily filled my need,
but I'd always have wondered if I had chosen the right one, always with the
concern in the back of my head what would happen if my chosen instance went down
or was defederated by others.

Another reason was just the vanity to have my own custom domain in the account
handle. I had been planning to switch my email from the clunky
[michael-forster.de](http://michael-forster.de) domain to my new and shiny
[forster.pro](http://forster.pro) domain anyway, and this seemed like a nice time
to do both.

## Why did I hesitate to host my own instance?

Well, first there is effort and cost, but those aren't really big reasons. Cost
seems really manageable (~5€/month) and effort doesn't really count for tech
tinkering.

The biggest drawback is that following hashtags becomes useless on my own
instance. I did find a good work-around for that though, and considering that
following hashtags is impacted by instance choice anyway, I figured that I'd
have to find a proper solution in any case.

Instead of following hashtags on my own instance I have lurking accounts on
other instances that I only use for reading, but not posting. I use the Tusky
app on my Android phone, and that has a nice feature to open a post in a
different account and reply from there. That works quite well for me.

Maybe at some point I'll try to set up a relay instead.

## Setting up my instance

So, I went ahead and configured my own instance. I used [this
setup](https://page.romeov.me/posts/setting-up-mastodon-with-nixos/) with NixOS
on a [Hetzner vServer](https://www.hetzner.com/cloud). I had become passionate
about Nix recently, and I have been using Hetzner for 20 years, so that seemed
like a great fit.

And it really only takes a couple of hours to get this configured. Minutes if
you've done it before. Just try it out, it's really easy. The only additional
change I made was to enable backup:

```nix
{
  networking = {
    domain = "forster.pro";
    firewall.allowedTCPPorts = [ 80 443 ];
  };

  services.mastodon = {
    enable = true;
    localDomain = "forster.pro";
    configureNginx = true;
    smtp.fromAddress = "";
  };
  services.postgresqlBackup.enable = true;

  security.acme = {
    acceptTerms = true;
    defaults.email = "michael@forster.pro";
  };
}
```

I got the smallest instance that Hetzner has (1 vCPU, 2GB RAM, 20 GB SSD,
3.92€/month), and I think that is a totally viable option.

It's a bit slow sometimes, but as I'm using it mostly through the app, that's
not a big issue. I might upgrade to a slightly bigger server at some point, but
I'll wait a bit more and see how this keeps up.

Overall I'm quite happy that I've decided to try this out.

{{% callout note %}}
  Since I've written this I've come to the conclusion that I need
  a larger instance, mostly because the default disk size of 20 GB is not
  enough. Hetzner makes it easy to switch instance types. I've now switched to
  2vCPUs and 40 GB disk space.
{{% /callout %}}
