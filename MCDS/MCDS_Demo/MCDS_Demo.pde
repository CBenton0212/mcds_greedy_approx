
void setup() {
  randomSeed(0);
  size(800, 800);
  textSize(16);
  frameRate(30);
  
  displayControls();
  initNodes();
}

void draw() {
  background(100);
  strokeWeight(1);
  moveNodes();
  updateNodes();
  displayNodes();

  if (showMCDS) mcds();
  
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(0,0, 150, 70);
  fill(0);
  text("Num nodes: " + NUMBER_OF_NODES, 10, 20);
  text("MCDS size: " + MCDS_SIZE, 10, 40);
  text("Max degree: " + MCDS_MAX_DEGREE, 10, 60);
}

void displayControls() {
  println(" p - Play/Pause");
  println(" r - Toggle transmission ranges");
  println(" e - Toggle edges");
}
