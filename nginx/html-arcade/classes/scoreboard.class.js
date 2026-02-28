class Scoreboard {
    constructor() {
        this.score = 0;
    }
    draw(context) {
        context.fillStyle = "#000";
        context.fillRect(10, 10, 130, 30);
        context.fillStyle = "#FFF";
        context.font = "20px  Courier New"
        context.fillText("Score: " + this.score, 15, 30)
    }
}