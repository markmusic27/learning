"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Sorter = void 0;
var Sorter = /** @class */ (function () {
    function Sorter(collection) {
        this.collection = collection;
    }
    Sorter.prototype.sort = function () {
        var length = this.collection.length;
        for (var i = 0; i < length; i++) {
            for (var j = 0; j < length - i - 1; j++) {
                if (this.collection) {
                }
                // const leftHand = this.collection[i];
                // this.collection[i] = this.collection[i + 1];
                // this.collection[i + 1] = leftHand;
            }
        }
    };
    return Sorter;
}());
exports.Sorter = Sorter;
var quoteDatabase = {
    a: {
        quote: 'Productivity is never an accident.',
        author: 'Paul J. Mayor',
    },
    b: {
        quote: 'Productivity is never an accident.',
        author: 'Paul J. Mayor',
    },
};
var databaseCom = ['a', 'b'];
var Quote = /** @class */ (function () {
    function Quote() {
    }
    Quote.prototype.generateQuote = function () {
        var randomNum = Math.floor(Math.random() * databaseCom.length);
        return {
            quote: quoteDatabase[databaseCom[randomNum]],
        };
    };
    return Quote;
}());
