package Figuras;

/**
 * Represent a square with its area and perimeter formulas
 */
public class Square extends FiguraGeometrica{

    //Attributes
    public Integer side;

    //Constructor
    public Square(String name, Integer side) {
        super(name);
        this.side = side;
    }

    /////////////////// GETTERS /////////////////////////////

    public Float getPerimeter() {
        return (float) 4 * side;
    }

    public Float getArea() {
        return (float) Math.pow(side, 2);
    }
}
