// import modules
// NOTE: socket.io version in nodejs 
// has to match flutter's socket_io version
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const CardTable = require('./models/table');

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
    socket.on('createTable', async ({ nickname }) => {
        console.log(nickname);
        try {
            // 1. make table
            let table = new CardTable();
            // 2. player is stored in the room
            let player = {
                socketID: socket.id,
                nickname: nickname,
            };
            table.players.push(player);
            table.turn = player;
            // 3. load the card table screen
            table = await table.save();
            console.log(table);
            // 4. save card table id
            const tableId = table._id.toString();
            
            socket.join(tableId);
            // tell our client that the room has been created
            // io -> send data to everyone
            // socket -> sending data to yourself
            io.to(tableId).emit('createTableSuccess', table);
        } catch (e) {
            console.log(e);
        } 
    });

    socket.on('jumpOnTable', async ({nickname, tableId}) => {
        console.log(`Attempting to jump on table ${nickname} with table id: ${tableId}`);
        try {
            if(!tableId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('errorOccurred', 'Please enter a valid Table ID');
                return;
            }
            let table = await CardTable.findById(tableId);
            console.log(table);

            if (table.isJoin) {
                let player = {
                    nickname: nickname,
                    socketID: socket.id,
                    seat: table.players.length,
                }
                socket.join(tableId);
                table.players.push(player);
                if (table.players.length == table.maxHands) {
                    table.isJoin = false;
                }
                table = await table.save();
                io.to(tableId).emit('joinTableSuccess', table);
                io.to(tableId).emit('updatePlayers', table.players);
                io.to(tableId).emit('updateTable', table);
            } else {
                socket.emit('errorOccurred', 'Game is in progress, try again later.')
            }
        } catch(e) {
            console.log(e);
        }
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
