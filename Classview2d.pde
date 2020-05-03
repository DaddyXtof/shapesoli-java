public class Classview2D extends GViewListener {
	int[] back_col = {#DEB3AD, #FFFFFF};
	int back_col_idx = 0;

	int sx, sy, ex, ey;
	String mousePos;

  public void update() {
    PGraphics v = getGraphics();
    v.beginDraw();
    v.background(back_col[back_col_idx]);
    //Need to go through map for current layer and display data
    if (sx != ex || sy != ey) {
      v.stroke(#FFFFFF);
      v.strokeWeight(1);
      v.strokeCap(ROUND);
      v.fill(#000000);
	    switch (selectedShape){
		    case NOTHING:
		      break;
		    case CIRCLE:
           v.ellipse(sx,sy,abs(sx-ex),abs(sy-ey));
		    break;
		    case SQUARE:
		    break;
		    case TRIANGLE:
		    break;
		    default:		
		  }    
	  }    
    v.text(getMousePositionText(), 4, v.height - 4);
    v.endDraw();
    validate(); // view is current no need to update
  }

  public void mouseEntered() {
    back_col_idx = 1;
    invalidate();
  }

  public void mouseExited() {
    back_col_idx = 0;
    invalidate();
  }

  public String getMousePositionText() {
    return "Mouse @ [" + mouseX() + ", " + mouseY() + "]";
  }

  public void mouseMoved() {
    invalidate();
  }
  
  public void mousePressed() {
    sx = ex = mouseX();
    sy = ey = mouseY();     
    invalidate();
  }
  
  public void mouseReleased(){
    PShape newShape;
    newShape=createShape(ELLIPSE, sx, sy, abs(ex-sx), abs(ey-sy));    
    map.put("Layer0", newShape);
    //invalidate();
  }

  public void mouseDragged() {
    ex = mouseX();
    ey = mouseY();
    invalidate();
  }
}
