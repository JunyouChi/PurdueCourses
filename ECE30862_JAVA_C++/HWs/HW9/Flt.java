import java.lang.Float;

class Flt implements Comparable{

   Float f; // the value returned by the value method.

   public Flt(float f) {this.f = new Float(f);}

    // Need to define the various interface functions here.
    public double value( ){
        return f.doubleValue();
    }
    //This method returns the value of a Comparable object as a double precision floating point number.
    public boolean lessThan(Comparable c){
        if (this.value() < c.value()) return true;
        else return false;
    }
    //This method compares what is returned by this.value( ) and c.value( ), and returns true is this.value < c.value( ), and false otherwise.
    public boolean equal(Comparable c){
        if (this.value() == c.value()) return true;
        else return false;
    }
    //This method compares what is returned by this.value( ) and c.value( ), and returns true is this.value == c.value( ), and false otherwise.
    public boolean greaterThan(Comparable c){
        if (this.value() > c.value()) return true;
        else return false;
    }
}