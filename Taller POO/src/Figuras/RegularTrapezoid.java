package Figuras;

/**
 * Represent a regular trapezoid with its area and perimeter formulas
 */
public class RegularTrapezoid extends FiguraGeometrica {

    //Attributes
    public Integer base1;
    public Integer base2;
    public Integer height;
    public Integer side;

    //Constructor
    public RegularTrapezoid(String name, Integer base1, Integer base2, Integer height) {
        super(name);
        this.base1 = base1;
        this.base2 = base2;
        this.height = height;
        this.side = (int) Math.sqrt(Math.pow((base2 - base1), 2) + Math.pow(height,2));
    }

    /////////////////// GETTERS //////////////////////////////////

    public Float getPerimeter() {
        return (float) base1 + base2 + (2 * side);
    }

    public Float getArea() {
        return (float) (base1 + base2) * height / 2;
    }
}
