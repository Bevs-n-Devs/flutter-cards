const mongoose = require('mongoose');
const playerSchema = require('./player');

const tableSchema = new mongoose.Schema({
    players: {
        type: Number,
        default: 1
    },
    maxHands: {
        type: Number,
        default: 4
    },
    currentHand: {
        required: true,
        type: Number,
        default: 1
    },
    players: [playerSchema],
    // setting the room private or not
    isJoin: {
        type: Boolean,
        default: true
    },
    // which player is currently playing
    turn: playerSchema,
    
    turnIndex: {
        type: Number,
        default: 0
    },
});

const gameModel = mongoose.model('Table', tableSchema);
module.exports = gameModel;