enum ColliderType {
}

class Collider implements ICollidable {  


  Collider() {
  }

  boolean collided(BoxCollider _boxCollider) {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      //BoxCollider boxCollider = (BoxCollider)this;
      
        //return rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h);
        println("Box box collision");
  
    }
    catch(Exception e) {
    }

    try {
      CircleCollider circleCollider = (CircleCollider)this;
      if (circleCollider !=null) {
        println("circle box collision");
      }
    }
    catch(Exception e) {
    }
    try {
      PolygonCollider polygonCollider = (PolygonCollider)this;
      if (polygonCollider !=null) {
        println("polygon box collision");
      }
    }
    catch(Exception e) {
    }

    return false;
  }
  boolean collided(CircleCollider _circleCollider) {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      //BoxCollider boxCollider = (BoxCollider)this;
      if (boxCollider != null) {
        println("Box circle collision");
      }
    }
    catch(Exception e) {
    }

    try {
      CircleCollider circleCollider = (CircleCollider)this;
      return circleCircle(circleCollider, _circleCollider);
    }
    catch(Exception e) {
    }
    try {
      PolygonCollider polygonCollider = (PolygonCollider)this;
      if (polygonCollider !=null) {
        println("polygon circle collision");
      }
    }
    catch(Exception e) {
    }

    return false;
  }


  boolean collided(PolygonCollider _polygonCollider) {
    try {
      BoxCollider boxCollider = (BoxCollider)this;
      //BoxCollider boxCollider = (BoxCollider)this;
      if (boxCollider != null) {
        println("Box polygon collision");
      }
    }
    catch(Exception e) {
    }

    try {
      CircleCollider circleCollider = (CircleCollider)this;
      if (circleCollider !=null) {
        println("circle polygon collision");
      }
    }
    catch(Exception e) {
    }
    try {
      PolygonCollider polygonCollider = (PolygonCollider)this;
      if (polygonCollider !=null) {
        println("polygon polygon collision");
      }
    }
    catch(Exception e) {
    }

    return false;
  }



  boolean circleCircle(CircleCollider circleCollider1, CircleCollider circleCollider2) {
    // get distance between the circle's centers
    // use the Pythagorean Theorem to compute the distance
    float distX = circleCollider1.position.x - circleCollider2.position.x;
    float distY = circleCollider1.position.y - circleCollider2.position.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the sum of the circle's
    // radii, the circles are touching!
    if (distance <= circleCollider1.radius+circleCollider2.radius) {
      return true;
    }
    return false;
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
  
}
