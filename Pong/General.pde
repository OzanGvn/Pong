import processing.sound.*; //Importerandet av processing.sound för att kunna använda spelljuden

float x, y, w, h, speedX, speedY;
int paddleXL, paddleYL;
int paddleW, paddleH, paddleS; 
int paddleXR, paddleYR;

boolean upL, downL;  // Booleans för att 
boolean upR, downR;  // bli av med 'latency'

color colorL = color(255, 0, 255);  // Färgerna på respektive
color colorR = color(255, 255, 0);  // paddel

int scoreL = 0; 
int scoreR = 0;  // Poängsystemet och hur många poäng man behöver för att vinna
int winScore = 5;

SoundFile score;
SoundFile hitTorB;    // Deklarerar vad alla
SoundFile hitPaddle;  // ljudfiler heter
SoundFile music;

void setup() {
  
  fullScreen();
  
  x = width/2;
  y = height/2;
  w = 75;
  h = 75;
  speedX = 6;
  speedY = 4;
  
  textSize(50);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  paddleXL = 40;
  paddleYL = height/2;
  paddleXR = width-40;
  paddleYR = height/2;
  paddleW = 25;
  paddleH = 200;
  paddleS = 8;
  
  music = new SoundFile(this, "music.mp3"); // Binder music (som är bakgrundsmusiken) till en fil
  music.amp(0.3); // Amp för att kontrollera volymen av ljudfilerna
  music.play();
  music.loop(); // music.loop för att spela om ljudfilen efter den tar slut
  
  score = new SoundFile(this, "score.mp3"); // Binder score till en fil
  score.amp(0.5);
  
  hitTorB = new SoundFile(this, "hitTorB.mp3"); // Binder hitToporBottom till en fil
  hitTorB.amp(1);

  hitPaddle = new SoundFile(this, "hitpaddle.mp3"); // Binder hitPaddle till en fil
  hitPaddle.amp(1); 
}
void draw() { 
  background(0);
  drawLine();
  drawCircle();
  moveCircle();
  bounceOff();  // Ser till att allt som är i draw repeteras tills jag stänger av programmet
  drawPaddles();
  movePaddle();
  restrictPaddle();
  contactPaddle(); 
  scores();
  gameOver();
}
void drawLine() {
  stroke(100, 50, 150);
  strokeWeight(10);  // Ritar linjen i mitten
  line(width/2, 0, width/2, height);
  noStroke();
}
void scores() {
  fill(255);
  text(scoreL, 100, 50);  // Visar poängen på vardera spelares sida
  text(scoreR, width-100, 50);
}
void gameOver() {
  if(scoreL == winScore) {gameOverPage("Purple wins!", colorL);}  // Ifall scoreL == 5 || scoreR == 5 vinner någon av sidorna och gameOverPage startas
  if(scoreR == winScore) {gameOverPage("Yellow wins!", colorR);} 
}
void gameOverPage(String text, color c) {
  speedX = 0;
  speedY = 0;
  
  fill(255); 
  text("Game over ^-^", width/2, height/3 - 40);  // Allt som har att göra med spelets avslut: texten, tryck M1 för att starta om och att stoppa bollen 
  text("Click to play again!", width/2, height/3 + 40);
  fill(c);
  text(text, width/2, height/1.7);
  
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    speedX = 3;
    speedY = 2;
}}
void keyPressed() {
  if (key == 'w' || key == 'W') {upL = true;}
  if (key == 's' || key == 'S') {downL = true;}  // Ändra värdet på Booleansen när tangenten är nere
  if (keyCode == UP) {upR = true;}
  if (keyCode == DOWN) {downR = true; 
}}
void keyReleased() {
  if (key == 'w' || key == 'W') {upL = false;}
  if (key == 's' || key == 'S') {downL = false;} // Ändra värdet på Booleansen när tangenten är uppe
  if (keyCode == UP) {upR = false;}
  if (keyCode == DOWN) {downR = false;}
}
