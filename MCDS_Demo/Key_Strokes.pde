

void keyPressed() {
  if (key == '1') setNumberOfNodes(15);
  if (key == '2') setNumberOfNodes(75);
  if (key == '3') setNumberOfNodes(150);
  if (key == '4') setNumberOfNodes(300);
  if (key == '5') setNumberOfNodes(500);
  
  if (key == 'n') initNodes();
  if (key == 'e') showEdges = !showEdges;
  if (key == 'r') showRange = !showRange;
  
  if (key == 'm') showMCDS = !showMCDS;
  if (key == 'k') showMCDSRange = !showMCDSRange;
  
  if (key == 'p') play = !play;
}
