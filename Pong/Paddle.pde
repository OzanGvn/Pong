void drawPaddles() {
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}
void movePaddle() {
  if (upL) {paddleYL = paddleYL - paddleS;}
  if (upR) {paddleYR = paddleYR - paddleS;}    // Använder booleans för att flytta på paddlarna
  if (downL) {paddleYL = paddleYL + paddleS;}  // utan någon keyboard delay
  if (downR) {paddleYR = paddleYR + paddleS;}
}
void restrictPaddle() {
  if (paddleYL - paddleH/2 < 0) { paddleYL = paddleYL + paddleS;}
  if (paddleYR - paddleH/2 < 0) { paddleYR = paddleYR + paddleS;}       // Flyttar tillbaka paddlarna så att
  if (paddleYL + paddleH/2 > height) { paddleYL = paddleYL - paddleS;}  // dom inte kan åka ut ur skärmen
  if (paddleYR + paddleH/2 > height) { paddleYR = paddleYR - paddleS;}
}
void contactPaddle() {
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2 ) {
    if (speedX < 0) { speedX = speedX * -1.1;  // Vad som händer när bollen slår i paddleL
    hitPaddle.play();
}}
  else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
    if (speedX > 0) { speedX = speedX * -1.1;  // Vad som händer när bollen slår i paddleR
    hitPaddle.play();
}}}
