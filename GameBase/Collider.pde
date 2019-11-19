class Collider implements ICollidable {  

  Collider() {
  }

  boolean collided(BoxCollider _boxCollider) {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      return rectRect(boxCollider, _boxCollider);
    }
    catch(Exception e) {
    }

    try {
      CircleCollider circleCollider = (CircleCollider)this;
      return circleRect(circleCollider.position.x, circleCollider.position.y, circleCollider.radius, _boxCollider.position.x, _boxCollider.position.y, _boxCollider.colWidth, _boxCollider.colHeight);
    }
    catch(Exception e) {
    }
    return false;
  }

  boolean collided(CircleCollider _circleCollider) {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      return circleRect(_circleCollider.position.x, _circleCollider.position.y, _circleCollider.radius, boxCollider.position.x, boxCollider.position.y, boxCollider.colWidth, boxCollider.colHeight);
    }
    catch(Exception e) {
    }
    try {
      CircleCollider circleCollider = (CircleCollider)this;
      return circleCircle(circleCollider, _circleCollider);
    }
    catch(Exception e) {
    }
    return false;
  }

  boolean isMouseOver() {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      return pointRect(mouseX, mouseY, boxCollider.position.x, boxCollider.position.y, boxCollider.colWidth, boxCollider.colHeight);
    }
    catch(Exception e) {
    }
    try {
      CircleCollider circleCollider = (CircleCollider)this;
      return pointCircle(mouseX, mouseY, circleCollider.position.x, circleCollider.position.y, circleCollider.radius);
    }
    catch(Exception e) {
    }
    return false;
  }



  // Utility
  boolean circleCircle(CircleCollider circleCollider1, CircleCollider circleCollider2) {
    float distX = circleCollider1.position.x - circleCollider2.position.x;
    float distY = circleCollider1.position.y - circleCollider2.position.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );


    if (distance <= circleCollider1.radius+circleCollider2.radius) {
      return true;
    }
    return false;
  }



  boolean rectRect(BoxCollider box1, BoxCollider box2) {
    return rectRect(box1.position.x, box1.position.y, box1.colWidth, box1.colHeight, box2.position.x, box2.position.y, box2.colWidth, box2.colHeight);
  }

  boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {
    // are the sides of one rectangle touching the other?
    if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
      r1x <= r2x + r2w &&    // r1 left edge past r2 right
      r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
      r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
      return true;
    }
    return false;
  }


  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {
    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }

  boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {

    // is the point inside the rectangle's bounds?
    if (px >= rx &&        // right of the left edge AND
      px <= rx + rw &&   // left of the right edge AND
      py >= ry &&        // below the top AND
      py <= ry + rh) {   // above the bottom
      return true;
    }
    return false;
  }

  boolean pointCircle(float px, float py, float cx, float cy, float r) {

    // get distance between the point and circle's center
    // using the Pythagorean Theorem
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the circle's
    // radius the point is inside!
    if (distance <= r) {
      return true;
    }
    return false;
  }
}
