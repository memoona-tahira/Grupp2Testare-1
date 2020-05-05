class Game {
    constructor() {
        this.playerName1 = this.inputName(1);
        this.playerName2 = this.inputName(2);
        this.addEventListener();
        this.start();
    }
    start() {
        this.board = new Board(this);
    }

    tellTurn(player) {
        player = +player
        if (player === 1 || player === 2) {
            $(".message").innerHTML = player == 1 ? this.playerName1 + ' tur.' : this.playerName2 + ' tur.';
        } else {
            throw new Error('player must be 1 or 2');
        }
    }

    inputName(palyerNumber) {
        try { // Bara för att prompt inte funkar när vi kör tester
            let name = prompt('Input player ' + palyerNumber + ' name');
            return name;
        }
        catch {
            return 'Player ' + palyerNumber
        }
    }
    over(won) {
        if (won === "draw") {
            $(".message").innerHTML = "Det blev oavgjort!";
        } else {
            won = +won
            if (won === 1) {
                $(".message").innerHTML = this.playerName1 + ' vann!';
            } else if (won === 2) {
                $(".message").innerHTML = this.playerName2 + ' vann!';
            } else {
                throw (new Error('won must be “draw”, 1 or 2'));
            }
        }
    }

    addEventListener() {
        $('.message').addEventListener('click', e => {
            if (e.target.closest('.again')) {
                this.start();
            }
        });
    }

}


// make it possible to test on backend
if (typeof global !== 'undefined') {
    global.Game = Game
};