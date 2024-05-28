const mongoose = require("mongoose");

const playerSchema = new mongoose.Schema({
    nickname: {
        type: String,
        trim: true,
    },
    socketID: {
        type: String,
    },
    points: {
        type: Number,
        default: 0
    },
    playerSeat: {
        type: Number,
        default: 0,
    }
});

module.exports = playerSchema;