class Generator {

    constructor() {
        this.coins = []
    }

    generate() {
        const value = Math.floor(Math.random() * 3) + 1;
        const newCoin = new Coin(value);
        this.coins.push(newCoin);
        newCoin.x = Math.floor( Math.random() * (1 + CANVAS_WIDTH - newCoin.size) );
        newCoin.y = Math.floor( Math.random() * (1 + CANVAS_HEIGHT - newCoin.size) );
        const self = this;
        setTimeout(function() {
            self.expireCoin(newCoin)
        }, COIN_LIFESPAN)
    }

    drawCoins(context) {
        for (let i = 0; i < this.coins.length; i++) {
            this.coins[i].draw(context);
        }
    }
    /**
     * Removes a coin from the list of all coins.
     * @param {Coin} coin Coin to remove
     */
    expireCoin(coin) {
        const index = this.coins.indexOf(coin);
        if(index > -1) {
            this.coins.splice(index, 1);
        }
                 
    }
}