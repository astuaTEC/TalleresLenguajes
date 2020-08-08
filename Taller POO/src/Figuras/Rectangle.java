package Figuras;

/**
 *
 */
public class Rectangle extends FiguraGeometrica {

    //Attributes
    public Integer width;
    public Integer large;

    //Constructor
    public Rectangle(String name, Integer width, Integer large) {
        super(name);
        this.width = width;
        this.large = large;
    }

    /////////////////// GETTERS //////////////////////////////////

    public Float getPerimeter() {
        return (float) (2 * width) + (2 * large) ;
    }

    public Float getArea() {
        return (float) (width * large);
    }
}
