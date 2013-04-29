Title: Cms blog project almost online
Author: Drew Wu
Date: Sun, 29 Apr 2013 05:41:35 GMT-0700 (PST)
Node: v0.10.3

## Node.js, Wheat, and Git

This blog is my first foray into using Node.js. It uses the wheat module from [Tim Caswell](http://creationix.com/) which
handles the blogging framework. I've made quite a few tweaks to the UI, but if you'd like to see the orginal project 
you can go to [http://howtonode.org](http://howtonode.org). The markdown files are pushed to a git repo server running
on the site. 

## Amazon EC2

This site is hosted on an Amazon EC2 free tier instance. I've used them before and my general thoughts on whether to 
cloud or not depend on whether your company is just starting out or not. After a certain size threshold, it's cheaper
to hire and run your own Data Center. Also, you don't have to suffer frequent outages like we see in Amazon-East :)

## The Badass CMS Project...

Okay, so I don't know how bad ass this project is going to be, but my intention is to allow others to use my setup 
to spin up there own blogging instances. Who knows, maybe some charitable individuals might contribute to the 
project as well? So that you know the direction this is heading, I'm planning to include new UI/UX functionality 
in the form of Voxel JS, with the node module that can play music... And maybe even "Door games"... So stay tuned.

This project is hosted on [http://github.com/drewswu/BadassCMS.git](http://github.com/drewswu/BadassCMS.git)

## Just a little bit more to go...

I figure another week and I'll consider it ready for use for simple blogging by others. In the wiki I'll be adding 
more explicit instructions on spinning up a free Amazon instance. And then it should be a cinch to get up and running.
