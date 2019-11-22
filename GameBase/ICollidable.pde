interface ICollidable{
  boolean collided(Collider collider);
  boolean collided(BoxCollider box);
  boolean collided(CircleCollider circle);
  boolean isMouseOver();
}
