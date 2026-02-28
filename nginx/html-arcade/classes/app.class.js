
class App {
    

    constructor() {
        this.canvas = new Canvas(CANVAS_WIDTH, CANVAS_HEIGHT);
        this.generator = new Generator();
        this.scoreboard = new Scoreboard();

     /* Create interval  */
        const self = this;
      setInterval(function() {
        self.run();
        }, REFRESH_RATE);

    

    this.canvas.context.canvas.addEventListener("click", event => {
        const clickX = event.x - event.target.getBoundingClientRect().left;
        const clickY = event.y - event.target.getBoundingClientRect().top;

        for (let i = 0; i < self.generator.coins.length; i++) {
            const coin = self.generator.coins[i];
            if (clickX >= coin.x && clickX <= coin.x + coin.size && clickY >= coin.y && clickY <= coin.y + coin.size) {
                    self.clickCoin(coin);
                }
            }
        });
    }
        run() {
            this.generator.generate();

            this.canvas.clear();
            this.generator.drawCoins(this.canvas.context);
            this.scoreboard.draw(this.canvas.context);
        }

        clickCoin(coin) {
            this.scoreboard.score += coin.value;
            this.generator.expireCoin(coin);
        }
}