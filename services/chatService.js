var path = require('path');

exports.homePage = function(req, res){
  res.sendFile(path.dirname(require.main.filename) + '/views/index.html');
};

exports.createSocket = function(http, io){
  var nsp = io.of('/chat');

  nsp.on('connection', function(socket){
    socket.on('chat message', function(msg){
      nsp.emit('chat message', msg);
    });
  });
};
