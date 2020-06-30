


void drawArrow(float x1, float y1, float x2, float y2) {
  float a = dist(x1, y1, x2, y2) / 50;
  pushMatrix();
  translate(x2, y2);
  rotate(atan2(y2 - y1, x2 - x1));
  triangle(-a * 2 , -a, 0, 0, -a * 2, a);
  popMatrix();
  line(x1, y1, x2, y2);  
}

void initNodes() {
  ID_INDEX = 0;
  nodes = new ArrayList<Entity>();
  for (int i = 0; i < NUMBER_OF_NODES; i++) 
    nodes.add(randomEntity());
}

void setNumberOfNodes(int num) {
  NUMBER_OF_NODES = num;
  edges = new boolean[NUMBER_OF_NODES][NUMBER_OF_NODES];
  initNodes();
}

Entity randomEntity() {
  float x = random(0, width);
  float y = random(0, height);
  float r = random(R_MIN, R_MAX);
  float rand = random(0, 1);
  
  if   (rand > .3) return new LinearEntity(x, y, r);
  else             return new StaticEntity(x, y, r);
}

void updateNodes() {
  for (Entity node : nodes) node.update();
}

void displayNodes() {
  for (Entity node : nodes) node.display();
}

void moveNodes() {
  for (Entity node : nodes) node.move();
}
