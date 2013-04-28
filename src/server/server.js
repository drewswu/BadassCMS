// Just a basic server setup for this site
var Stack = require('stack'),
    Http = require('http');

Http.createServer(Stack(
  require('wheat')(process.env.JOYENT ? process.env.HOME + "/" : __dirname )
)).listen(process.env.JOYENT ? 80 : 8080);
