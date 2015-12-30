var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var chatService = require('./services/chatService')
var port = 3000;

app.get('/', chatService.homePage);

chatService.createSocket(http, io);

http.listen(port, function(){
  console.log('listening on *:3000');
});
