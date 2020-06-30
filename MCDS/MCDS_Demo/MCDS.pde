

int MCDS_SIZE = 0;
int MCDS_MAX_DEGREE = 0;

void mcds() {  
  ArrayList<Entity> A = new ArrayList<Entity>(nodes);
  ArrayList<Entity> B = new ArrayList<Entity>(nodes);
  ArrayList<Entity> C = new ArrayList<Entity>();
  boolean[][] G = new boolean[NUMBER_OF_NODES][NUMBER_OF_NODES];
  boolean[][] mcds_edges = new boolean[NUMBER_OF_NODES][NUMBER_OF_NODES];
  
  for(int i = 0; i < edges.length; i++)
    System.arraycopy(edges[i], 0, G[i], 0, NUMBER_OF_NODES);
  
  int numUncoveredNodes = NUMBER_OF_NODES;
  Entity currentNode;
  
  while (numUncoveredNodes > 0) { //<>//
    currentNode = highestDegreeAndConnectedVertex(A, C, mcds_edges);
    if (currentNode == null) break;
    
    C.add(currentNode);
    
    int removed = removeCoveredNodes(currentNode, G);
    numUncoveredNodes -= removed;
    A.remove(currentNode);
    
    computeNumNeighbors(A, G);
  }
  
  drawMCDS(C, mcds_edges);
  MCDS_SIZE = C.size();
}

Entity highestDegreeAndConnectedVertex(ArrayList<Entity> A, ArrayList<Entity> C, boolean[][] mcds_edges) {
  Collections.sort(A);
  
  if (C.isEmpty()) {
    MCDS_MAX_DEGREE = A.get(0).numNeighbors;
    return A.get(0);
  }
  
  int id;
  Entity current;
  for (int i = 0; i < A.size(); i++) {
    current = A.get(i);
    id = connectedFrom(current, C);
    if (id >= 0) {
      mcds_edges[id][current.id] = true;
      return current;
    }
  }
  
  return null;
}

int connectedFrom(Entity a, ArrayList<Entity> C) {
  for (Entity c : C)
      if (edges[c.id][a.id]) return c.id;
  return -1;
}

int removeCoveredNodes(Entity node, boolean[][] G) {
  int numRemoved = 0;
  int index = node.id;
  
  for (int i = 0; i < NUMBER_OF_NODES; i++) {
    if (G[index][i]) {
      numRemoved++;
      G[index][i] = false;
      for (int j = 0; j < NUMBER_OF_NODES; j++)
        G[j][i] = false;
    }
  }
  return numRemoved;
}

void computeNumNeighbors(ArrayList<Entity> A, boolean[][] G) {
  ArrayList<Entity> removables = new ArrayList<Entity>();
  for (Entity a : A) {
    int neighbors = 0;
    for (int i = 0; i < NUMBER_OF_NODES; i++) {
      if (G[a.id][i]) neighbors++;
    }
    a.numNeighbors = neighbors;
    if (neighbors == 0) removables.add(a);
  }
  
  for (Entity e : removables) A.remove(e);
}

void drawMCDS(ArrayList<Entity> C, boolean[][] mcds_edges) {
  noFill();
  
  int index, modifier = 0;
  Entity e1, e2;
  
  for (Entity c : C) {
    index = c.id;
    for (int i = 0; i < NUMBER_OF_NODES; i++) {
      if (mcds_edges[index][i]) {
        e1 = nodes.get(index);
        e2 = nodes.get(i);
        stroke(255 - (2 * modifier), 0 + (2 * modifier++), 0);
        strokeWeight(10);
        line(e1.xPos, e1.yPos, e2.xPos, e2.yPos);
      }
    }
    if (showMCDSRange) {
      stroke(0, 255, 0);
      strokeWeight(5);
      fill(0, 255, 0, 50);
      circle(c.xPos, c.yPos, c.radius * 2);
    }
  }
  
  
}
