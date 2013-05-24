Title: "Jagshemash! My Name is @BoratTechFamily"
Author: Drew Wu
Date: Fri, 24 May 2013 00:16:00 GMT-0700 (PST)
Node: 2013.05.24
I thought it'd be kind of cool to aggregate all of the Borat Tech accounts on Twitter into a single account. Hence @BoratTechFamily was born.

## Twitter API

Working with the Twitter API is easy. Its a rigorous API with a lot of common sense features and endpoints. It is well served by the documentation, which is spot on. The basic flow works in several steps:

1) Enable access to the API on your Twitter account
2) Use the API key to authenticate via oauth
3) <b>Get</b> all the screen_names from your following list
4) <b>Get</b> the last n tweet_ids from all the screen_names
5) <b>Post</b> the retweet url with the tweet_ids
6) Profit!

## Python

These are the modules I used:
  __future__, requests, random, json, pprint, urlparse, requests_oauthlib

