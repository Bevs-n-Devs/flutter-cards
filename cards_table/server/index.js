// import modules
// NOTE: socket.io version in nodejs 
// has to match flutter's socket_io version
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
// optional syntax, if process env PORT
// does not exist, default to PORT 3000
const port = process.env.PORT | 3000
var server = http.createServer(app);

var io = require("socket.io")(server);

// middleware 
// processing data between client & server
// e.g. converting data format csv->json 
app.use(express.json());

// After creating the MongoDB DB
// connect to the DB
// NOTE : special characters cause sign-in error e.g. @, !, &, etc.
const DB = 
    "mongodb+srv://princton1:testing1password@testcluster.6xgcocx.mongodb.net/?retryWrites=true&w=majority&appName=testCluster";

io.on("connection", (socket) => {
    console.log("socketio connected!");
    socket.on('createTable', ({ nickname }) => {
        console.log(nickname);
    });
});

mongoose
    .connect(DB)
    .then(() => {
        console.log("Connection to MongoDB successful!");
    })
    .catch((e)=> {
        console.log(e);
    });

// 0.0.0.0 ip address can be accessed from anywhere
server.listen(port, '0.0.0.0', () => {
    console.log(`Server listening on port: ${port}!`);
});
