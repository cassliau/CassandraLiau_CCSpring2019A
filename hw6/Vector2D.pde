
static class Vector2D{
    /* FIELDS */
    public float x = 0;
    public float y = 0;
    
    
    /* CONSTRUCTORS */
    //blank constructor
    public Vector2D(){
    
    }
    
    //x,y constructor 
    public Vector2D(float x, float y){
      this.x = x;
      this.y = y;
    }
    
    /* non-static methods: usable only by objects of the class */
      public void add(Vector2D other) {
      this.x += other.x;
      this.y += other.y;
    }
  
    public static Vector2D add (Vector2D v1, Vector2D v2) {
      Vector2D result = new Vector2D(v1.x + v2.x, v1.y + v2.y);
      return result;
    }
    
    public void mult(float scalar) {
      this.x *= scalar;
      this.y *= scalar;
    }
    
    public void div (float scalar) {
      this.x /= scalar;
      this.y /= scalar;
    }
    
    public float mag(){
      //it is calling it on a vector, so no argument
      float result = sqrt(pow(x,2) + pow(y,2));
      return result;
    }
    
    public void norm(){
      //calculate my magnitude
      float mag = sqrt (pow (this.x, 2) + pow(this.y, 2));
      this.x /= mag;
      this.y /= mag;
    }
  
    //method that multiplies a vector by a scalar
    public Vector2D mult(Vector2D v, float scalar) {
      Vector2D result = new Vector2D(v.x * scalar, v.y * scalar);
      return result;
    }
    public Vector2D div(Vector2D v, float scalar) {
      Vector2D result = new Vector2D(v.x / scalar, v.y / scalar);
      return result;
    }
}
