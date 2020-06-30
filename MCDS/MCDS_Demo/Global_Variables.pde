
import java.util.*;


ArrayList<Entity> nodes;

int NUMBER_OF_NODES = 20;
final int NODE_SIZE = 20;

final float SPEED = 1;

final color NODE_COLOR = color(255);
final color TX_RANGE_COLOR = color(255, 0, 0);
final color EDGE_COLOR = color(0, 0, 255);

final int R_MIN = 200;
final int R_MAX = 500;


boolean play = false;
boolean showRange = false;
boolean showEdges = false;
boolean showMCDS = false;
boolean showMCDSRange = false;

boolean[][] edges = new boolean[NUMBER_OF_NODES][NUMBER_OF_NODES];
