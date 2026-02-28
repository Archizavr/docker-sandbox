const canvas = document.querySelector("canvas");
const context = canvas.getContext("2d");

/*
 * Line
 */
context.beginPath(); //Start drawing a path / line
context.moveTo(20, 20); //Starting coordinates (x, y) or (distance from left, distance frm top)
context.lineTo(300, 40); // Ending coordinates

context.strokeStyle = "#FF0000";
context.lineWidth = 5;

context.stroke(); //Finish setting the properties/values and draw the result/line

/*
 * Costumer shape using path / multiple lines
 */

context.beginPath();

context.moveTo(450, 450);
context.lineTo(550, 300);
context.lineTo(400, 250);
context.lineTo(420, 500);
context.lineTo(500, 500);
context.closePath();

context.stroke();
context.fillStyle = "#0000FF";
context.fill();

/*
 * Exercise (triangle)
 */

context.beginPath();

context.moveTo(100, 500);
context.lineTo(200, 300);
context.lineTo(300, 500);
context.closePath();
context.strokeStyle = "#00FF00";
context.lineWidth = 2;
context.stroke();

context.fillStyle = "#FF00FF";
context.fillRect(50, 50, 120, 80);


context.moveTo(150, 100);

context.arc(100, 100, 200, 0, Math.PI * 2, false);
context.stroke();


let canvasImageSource = document.createElement("img");
canvasImageSource.src = "resources/smile.png";
canvasImageSource.addEventListener("load", e => {
    context.drawImage(canvasImageSource, 300, 300, 50, 50);
})

context.clearRect(20, 20, 100, 150);
context.clearRect(0, 0, 600, 600)