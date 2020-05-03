public class Classview3D extends GViewListener {
  float a = 0;         // current angle of rotation
  float delta = 0.001f; // the change in angle for each frame
  boolean is_rotating = true;

  public void update() {
    PGraphics3D v = (PGraphics3D) getGraphics();
    v.beginDraw();
    v.ambientLight(100, 100, 100);
    v.directionalLight(255, 255, 255, 0.5f, 1, -2f);
    v.background(0);
    v.translate(v.width/2, v.height/2);
    v.rotateX(0.19f * a);
    v.rotateY(1.101f * a);
    v.rotateZ(1.357f * a);
    v.fill(#FFFFFF);
    v.stroke(#F51663);
    v.strokeWeight(1);
    v.scale(2);
    v.box(210,297,2);
    a += delta;
    v.endDraw();
  }
  public void mouseClicked() {
    if (is_rotating) {
      validate(); // will stop update() and pause the animation
    } else {
      invalidate(); // will enable update() and restart the animation
    }
    is_rotating = !is_rotating;
  }
  public void reverseRotation() {
    delta *= -1;
 }
}