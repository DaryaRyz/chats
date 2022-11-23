const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server, {
    cors: {
        origin: "http://localhost:8080",
        methods: ["GET", "POST"]
    }
});

var clients = {};

io.on('connection', socket => {
   console.log("connected");
   console.log(socket.id, "has joined");
   socket.on("signin", (id) => {
    console.log(id);
    clients[id] = socket;
   });
   socket.on("message", (msg) => {
    console.log(msg);
    let targetId = msg.targetId;
    if(clients[targetId]) clients[targetId].emit("message", msg);
   })
});
app.route("/check").get((req, res) => {
    return res.json(req);
});

server.listen(process.env.PORT, () => {
  console.log('listening on *:3000');
});