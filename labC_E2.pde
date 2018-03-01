import 	processing.sound.*;

SoundFile edgeSound, centerSound;
PImage upper, lower;

int changing_width = 1;
int amount;

AudioIn in;
Amplitude amp;

void setup() {
    in = new AudioIn(this, 0);
    amp = new Amplitude(this);
    in.start();
    amp.input(in);

    upper = loadImage("upper.jpg");
    lower = loadImage("lower.jpg");

	size(displayWidth,displayHeight);
	rectMode(CENTER);
	noStroke();
	//frameRate(30);
	changing_width = 3;
	amount = 40;
	edgeSound = new SoundFile(this, "positive-beeps.wav");
	centerSound = new SoundFile(this, "negative-beeps.wav");
}

void draw() {
	background(255);
    // rect(displayWidth/2, displayHeight/2, amp.analyze()*2000 , amp.analyze()*2000);
    // fill(0);
    image(upper, displayWidth/3, displayHeight/4 - amp.analyze()*900);
    image(lower, displayWidth/3, (displayHeight/4+200) + amp.analyze()*900);

    if(/*amp.analyze()*900 >= displayWidth || */amp.analyze()*900 >= displayHeight){
    	edgeSound.play();
    }
    
    println(amp.analyze()*1000 + "\n");
	
}