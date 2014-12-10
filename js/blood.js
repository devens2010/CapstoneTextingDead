function blood() {
    targetFPS = 30;
    myCanvas = document.querySelector('#blood');
    ctx = myCanvas.getContext('2d');
    
    imageObj = new Image();
    imageObj.onload = function() {
        bloodDrip.setImage(imageObj);
    };
    imageObj.src = "images/blood.png";
    
    init();
    if (ctx) {
        window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
        requestAnimationFrame(update);
    }
}   // end blood

function init() {
    bloodDrip = new Particle(ctx);
    bloodDrip.setPosition(myCanvas.width / 2,-500);
    bloodDrip.setVelocity(0,7);
}   // end init

function update() {
    setTimeout(function() {
        updateScene();
        drawScene();
        requestAnimationFrame(update);
    }, 1000 / targetFPS);
}   // end update

function drawScene() {
    ctx.fillStyle = "rgba(28, 23, 18, .4)";
    ctx.fillRect(0,0, myCanvas.width, myCanvas.height);
    bloodDrip.draw();
}   // end drawScene

function updateScene() {
    bloodDrip.update();
}

function Particle(context) {
    this.x = 0;
    this.y = 0;
    this.xVelocity = 0;
    this.yVelocity = 0;
    this.context = context;
    
    this.setPosition = function(xPos, yPos) {
        this.x = xPos;
        this.y = yPos;
    };
    
    this.setVelocity = function(xVel, yVel) {
        this.xVelocity = xVel;
        this.yVelocity = yVel;
    };
    
    this.setImage = function(image) {
        this.image = image;
    };
    
    this.draw = function() {
        if (this.image) {
            this.context.drawImage(this.image, this.x - this.image.width / 2, this.y - this.image.width / 2);
        }
    };
    
    this.update = function() {
        this.x += this.xVelocity;
        this.y += this.yVelocity;
        
        if (this.y >= myCanvas.height / 2) {
            this.xVelocity = 0;
            this.yVelocity = 0;
        }
    };
    
}
