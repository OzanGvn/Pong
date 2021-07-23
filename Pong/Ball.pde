void drawCircle() {
  fill(255, 0, 0);
  ellipse(x, y, w, h);  // Ritar bollen 
}
void moveCircle() {
  x = x + speedX; 
  y = y + speedY;
}
void bounceOff() {
  if ( x > width - w/2) {
    setup();
    speedX = -speedX;
    scoreL = scoreL + 1;  // Vad som händer ifall bollen slår i höger sida
    score.play();
    music.stop();
  }else if ( x < 0 + w/2) {
    setup();
    scoreR = scoreR + 1;  // Vad som händer ifall bollen slår i vänster sida
    score.play();
    music.stop();
  }if ( y > height - h/2) { speedY = speedY * -1.1;
  hitTorB.play(); // Vad som händer ifall bollen slår i botten av skärmen
  }else if ( y < 0 + h/2) { speedY = speedY * -1.1;
  hitTorB.play(); // Vad som händer ifall bollen slår i toppen av skärmen
}}
