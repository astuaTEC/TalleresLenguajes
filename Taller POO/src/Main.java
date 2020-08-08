import Figuras.*;

import java.util.ArrayList;

/**
 * INSTITUTO TECNOLÓGICO DE COSTA RICA
 * LENGUAJES, COMPILADORES E INTÉRPRETES
 * I SEMESTRE 2020
 * TALLER POO
 * Saymon Astúa Madrigal - 2018143188
 */

/**
 * Main class
 */
public class Main {

    public static void main(String[] args) {

        // Se inicializa el arreglo y las figures
        ArrayList<FiguraGeometrica> figures = new ArrayList<>();

        Circle circle = new Circle("Circle", 5);
        Square square = new Square("Square", 6);
        Rectangle rectangle = new Rectangle("Rectangle", 5, 10);
        RegularTrapezoid trapezoid = new RegularTrapezoid("Trapezoid", 3, 10, 5);
        Parallelogram parallelogram = new Parallelogram("Parallelogram", 5, 7, 6);

        // se agregan las figuras al arreglo
        figures.add(circle);
        figures.add(square);
        figures.add(rectangle);
        figures.add(trapezoid);
        figures.add(parallelogram);

        //Se imprime en pantalla el nombre de lafigura, su perímetro
        // y su área respectiva
        for(int i = 0; i < figures.size(); i++){
            FiguraGeometrica temp = figures.get(i);
            System.out.println("Figura: " + temp.name);
            System.out.println("Perímetro: " + temp.getPerimeter());
            System.out.println("Área: " + temp.getArea());
            System.out.println();
        }

    }
}
