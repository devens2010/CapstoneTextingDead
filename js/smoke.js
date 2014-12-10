/*function smoke() {
    smokePuffs = [];
    puffCount = 1000;
    maxVelocity = 2;
    targetFPS = 30;
    
    myCanvas = document.querySelector('#smoke');
    ctx = myCanvas.getContext('2d');
    
    imageObj = new Image();
    imageObj.onload = function() {
        smokePuffs.forEach(function(smokeParticle) {
            smokeParticle.setImage(imageObj);
        });
    };
    imageObj.src = "images/smoke60.png";
    
    init();
    
    if (ctx) {
        window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
        requestAnimationFrame(update);
    }
}   // end smoke()

function init() {
    for (var i = 0; i < puffCount; i++) {
        smokeParticle = new Particle(ctx);
        smokeParticle.setPosition(randRange(0, myCanvas.width), randRange(0, myCanvas.height));
        smokeParticle.setVelocity(randRange(-maxVelocity, maxVelocity), randRange(-maxVelocity, maxVelocity));
        smokePuffs.push(smokeParticle);
    }
}   // end init()

function update() {
    setTimeout(function() {
        updateScene();
        drawScene();
        requestAnimationFrame(update);
    }, 1000 / targetFPS);
}   // end update()

function drawScene() {
    smokePuffs.forEach(function(smokeParticle) {
        ctx.fillStyle = "rgba(28, 23, 18, .4)";
	ctx.fillRect(0, 0, myCanvas.width, myCanvas.height);
        smokeParticle.draw();
    });
}   // end drawScene()

function updateScene() {
    smokePuffs.forEach(function(smokeParticle) {
        smokeParticle.update();
    });
}   // end updateScene()

function Particle(context) {
    this.x = 0;
    this.y = 0;
    
    this.xVelocity = 0;
    this.yVelocity = 0;
    
    this.radius = 5;
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
        
        // boundary detection
        if (this.x >= myCanvas.width) {
            this.xVelocity *= -1;
            this.x = myCanvas.width;
        } else if (this.x <= 0) {
            this.xVelocity *= -1;
            this.x = 0;
        }
        
        if (this.y >= myCanvas.height) {
            this.yVelocity *= -1;
            this.y = myCanvas.height;
        } else if (this.y <= 0) {
            this.yVelocity *= -1;
            this.y = 0;
        }
        
    };
    
}   // end Particle()

function randRange(low, high) {
    return Math.random() * (high - low) + low;
}   // end randRange()
*/

function smoke() {
	
	// create an array to hold our particles
	smokePuffs = [];
	
	puffCount = 30;
	
	// maximum velocity in each direction
	maxVelocity = 2;
	
	// set frames per second
	targetFPS = 30;
	
	myCanvas = document.querySelector('#smoke');
	ctx = myCanvas.getContext('2d');
	
	// create an image object
	imageObj = new Image();
	
	// when the image finishes loading...
	imageObj.onload = function() {
		
		smokePuffs.forEach(function(smokeParticle) {
			
			smokeParticle.setImage(imageObj);
			
		});
		
	};
	
	imageObj.src = "images/smoke.png";
	
	// initialize the scene
	init();
	
	if (ctx) {	// if context is set, then we can draw the scene
		
		window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
		
		requestAnimationFrame(update);
		
	}	// end if context is set
	
}	// end smokeIt()

function init() {
	
	// 
	// create the smoke particles and set their 
	// initial positions and velocities
	//
	for (var i = 0; i < puffCount; i++) {
		
		smokeParticle = new Particle(ctx);
		
		// set the position to be inside the canvas boundaries
		smokeParticle.setPosition(randRange(220, 240), randRange(640, myCanvas.height));
		
		// set the initial velocity to be random and either negative or positive
		smokeParticle.setVelocity(randRange(-maxVelocity, maxVelocity), randRange(-maxVelocity, 0));
		
		// set up our array of smokeParticles
		smokePuffs.push(smokeParticle);
		
	}	// end for each new smokeParticle;
	
}	// end init()

function update() {
	
	setTimeout(function() {
		
		// update the scene
		updateScene();
		
		// draw the scene
		drawScene();
		
		// call update again recursively - endless loop
		requestAnimationFrame(update);
		
	}, 1000 / targetFPS);
	
}	// end update()

function drawScene() {
	
	// Clear the drawing surface (myCanvas) and fill it
	// with a black background
	ctx.fillStyle = "rgba(28, 23, 18, .4)";
	ctx.fillRect(0, 0, myCanvas.width, myCanvas.height);
	
	// go through all of the particles and draw them onto the canvas
	smokePuffs.forEach(function(smokeParticle) {
		
		// smokeParticle here was set above by the forEach() method.
		// it took the value in the current element of smokePuffs and 
		// stored it in our parameter variable we called smokeParticle.
		smokeParticle.draw();
		
	});
	
}	// end drawScene

function updateScene() {
	
	// go through all of the particles and update
	// their positions based on velocity
	smokePuffs.forEach(function(smokeParticle) {
		
		smokeParticle.update();
		
	});
	
}	// end updateScene

//
// particle constructor function
//
function Particle(context) {
	
	// set the x and y positions of the particle
	this.x = 0;
	this.y = 0;
	
	// set initial velocity values
	this.xVelocity = 0;
	this.yVelocity = 0;
	
	// set the radius property - use in our circle particles
	this.radius = 5;
	
	// store the context as a property of our particle object
	this.context = context;
	
	// 
	// define this particle object's methods
	// 
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
		
		// if an image is defined, draw it 
		if (this.image) {
			
			// 
			// copy an image to the canvas. use the drawImage() 
			// method of the canvas' context object and at a minimum
			// pass it the image location along the x and y axes
			// where we want the image to be
			//
			this.context.drawImage(this.image, this.x - this.image.width / 2, this.y - this.image.width / 2);
			
		}
		
		// draw circular particles
		/*
		this.context.beginPath();
		this.context.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
		this.context.fillStyle = "rgba(0, 255, 255, 0.7)";
		this.context.fill();
		this.context.closePath();
		*/
		
	};
	
	this.update = function() {
		
		// update the position of the particle based on velocity
		this.x += this.xVelocity;
		this.y += this.yVelocity;
		
		// boundary detection
		if (this.x >= myCanvas.width + 128) {	// right edge
                        this.xVelocity = randRange(-1, 1);
			this.y = myCanvas.height;
                        this.x = randRange(220, 240);
		}
		else if (this.x <= -128) {	// left edge
                        this.xVelocity = randRange(-1, 1);
			this.y = myCanvas.height;
                        this.x = randRange(220, 240);
		}
		
		else if (this.y <= -128) {	// top edge
                        this.xVelocity = randRange(-1, 1);
			this.y = myCanvas.height;
                        this.x = randRange(220, 240);
		}
		
	};
	
}	// end Particle()

function randRange(low, high) {
	
	return Math.random() * (high - low) + low;
	
} 	// end randRange()
