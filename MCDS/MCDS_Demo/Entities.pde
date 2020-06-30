
int ID_INDEX;

abstract class Entity implements Comparable {
  int id, numNeighbors;
  float xPos, yPos;
  final float radius;
  color vertexColor = NODE_COLOR;
  boolean covered = false;

  Entity(float x, float y, float d) {
    id = ID_INDEX++;
    xPos = x;
    yPos = y;
    radius = d / 2;
  }

  void update() {
    float delta_x, delta_y, distance;
    this.numNeighbors = 0;
    
    for (Entity other : nodes) {
      delta_x = this.xPos - other.xPos;
      delta_y = this.yPos - other.yPos;
      distance = sqrt(delta_x*delta_x + delta_y*delta_y);

      if (distance < this.radius) {
        edges[this.id][other.id] = true;
        this.numNeighbors++;
      } else {
        edges[this.id][other.id] = false;
      }
    }
    
  }

  void display() {
    fill(vertexColor);
    stroke(vertexColor);
    circle(xPos, yPos, NODE_SIZE);

    if (showRange) {
      noFill();
      stroke(TX_RANGE_COLOR);
      circle(xPos, yPos, (radius + radius));
    }

    if (showEdges) {
      noFill();
      stroke(EDGE_COLOR);
      Entity other;
      for (int index = 0; index < NUMBER_OF_NODES; index++) {
        if (edges[id][index]) {
          other = nodes.get(index);
          drawArrow(xPos, yPos, other.xPos, other.yPos);
        }
      }
    }
  }

  void move() { if (play) distinctMove(); }
  
  abstract void distinctMove();
  
  int compareTo(Object obj) {
    Entity other = (Entity) obj;
    return other.numNeighbors - this.numNeighbors;
  }
  
}

class StaticEntity extends Entity {
  StaticEntity(float x, float y, float r) {
    super(x, y, r);
  }

  void distinctMove() { /* do nothing */ }
}

class LinearEntity extends Entity {
  float delta_x, delta_y;

  LinearEntity(float x, float y, float r) {
    super(x, y, r);
    delta_x = random(-SPEED, SPEED);
    delta_y = random(-SPEED, SPEED);
  }

  void distinctMove() {
    if      (xPos < 0)       xPos = width;
    else if (xPos > width)   xPos = 0;
    else                     xPos += delta_x;

    if      (yPos < 0)       yPos = height;
    else if (yPos > height)  yPos = 0;
    else                     yPos += delta_y;
  }
}
