package Figuras;

/**
 * Represents the parent class of a geometric figure
 */

public class FiguraGeometrica {

    //Attributes
    public String name;

    //Constructor
    public FiguraGeometrica(String name){
        this.name = name;
    }

    // Methods
    public Float getPerimeter() {
        return (float) 0;
    }

    public Float getArea() {
        return (float) 0;
    }
}
