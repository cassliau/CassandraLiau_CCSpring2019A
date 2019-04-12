class Vector2D{

    /* CONSTRUCTOR */
    constructor(x = 0, y = 0){
        this.x = x;
        this.y = y;
    }
    
    /* NON-STATIC */
    add(other){
        this.x += other.x;
        this.y += other.y;
    }

    /* STATIC */
    static add(v1, v2){
        let v3 = new Vector2D();
        v3.x = v1.x + v2.x;
        v3.y = v1.y + v2.y;
        return v3;
    }

    //multiply
    mult(scalar){
        this.x *= scalar;
        this.y *= scalar;
    }

    //divide
    div(scalar){
        this.x /= scalar;
        this.y /= scalar;
    }

    //magnitude
    mag(){
        result = sqrt(pow(this.x,2) + pow(this.y,2));
        return result;
    }

    //divides magnitude
    norm(){
        mag = sqrt(pow(this.x,2) + pow(this.y,2));
        this.x /= mag;
        this.y /= mag;
    }

    //multiply vector with scalar
    mult(v, scalar){
        let v3 = new Vector2D();
        v3.x = v.x * scalar;
        v3.y = v.y * scalar;
        return v3;
    }

    //divide vector with scalar
    div(v, scalar){
        let v3 = new Vector2D();
        v3.x = v.x / scalar;
        v3.y = v.y / scalar;
        return v3;
    }
}