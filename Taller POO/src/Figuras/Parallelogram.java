package Figuras;

/**
 * Represent a parallelogram with its formulas for area and perimeter
 */
public class Parallelogram extends FiguraGeometrica{

    //Attributes
    public Integer base;
    public Integer height;
    public Integer side;

    //Constructor
    public Parallelogram(String name, Integer base, Integer height,  Integer side) {
        super(name);
        this.base = base;
        this.side = side;
        this.height = height;
    }

    /////////////////// GETTERS //////////////////////////////////

    public Float getPerimeter() {
        return (float) 2 * (base + side);
    }

    public Float getArea() {
        return (float) base * height;
    }
}
