interface ICollidable{
  boolean collided(BoxCollider box);
  boolean collided(CircleCollider circle);
  boolean isMouseOver();
}
