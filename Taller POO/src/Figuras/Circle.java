package Figuras;

/**
 * Represent a circle with its area and perimeter formulas
 */
public class Circle extends FiguraGeometrica {

    //Attributes
    public Integer radius;

    //Constructor
    public Circle(String name, Integer radius) {
        super(name);
        this.radius = radius;
    }

    /////////////////// GETTERS //////////////////////////////////

    public Float getPerimeter() {
        double perimetro = 2 * Math.PI * radius;
        return (float) perimetro;
    }

    public Float getArea() {
        double area = Math.PI * Math.pow(radius, 2);
        return (float) area;
    }
}
