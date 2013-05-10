Title: Cms blog project almost online
Author: Drew Wu
Date: Sun, 29 Apr 2013 05:41:35 GMT-0700 (PST)
Node: v0.10.3

This is my first foray into using Node.js. On the whole, it feels really alpha and a little hacked, but the promise of the 
Google V8 Javascript engine, with Node by Ryan Dahl, plus the most creative projects in tech right now, means this could be 
one seriously high-powered sandbox for running weird experiments.

## Node.js, Wheat, Github, and Git

This blog uses Node.js 0.10.3. It uses the wheat module from [Tim Caswell](http://creationix.com/) which
handles the blogging framework. I've made quite a few tweaks to the UI, but if you'd like to see the orginal project 
you can check it out at [http://howtonode.org](http://howtonode.org). The markdown files that are being served are 
pushed to a git repo running on this site. This means that once you fork my project, there isn't any dependence on 
Github for hosting your web content.

## Amazon EC2

This site is hosted on an Amazon EC2 free tier instance. I've used them before and my general thoughts on whether to 
cloud or not depend on whether your company is just starting out or not. For our purposes here, free is good. If you're wary of racking up additional costs, you can set an alert when your instance is about to exceed a bandwidth cap.

## The Github CMS Project...

Okay, so I don't know how useful this project is going to be, but my intention is to allow others to use my setup 
to spin up there own blogging instances. The direction I'm going with this will be trying to integrate other UI/UX functionality node modules like Voxel JS, and the node module that can play music... And maybe even "Door games"... So stay tuned.

If you'd like to fork this project, you can find it on Github: [http://github.com/drewswu/BadassCMS.git](http://github.com/drewswu/BadassCMS.git)

## Just a little bit more to go...

I figure another week and I'll consider it ready for use for simple blogging by others. In the wiki I'll be adding 
more explicit instructions on spinning up a free Amazon instance. And then it should be a cinch to get up and running.
