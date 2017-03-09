package main.java;

/**
 * Created by willsmith on 8/11/16.
 */
public class StringType
{
    public static void stringDemo()
    {
        //Java
        String one = "One String";
        System.out.println("One: " + one);

        String two = "Two String";
        System.out.println("Two: " + two);

        String red = "Red String";
        System.out.println("Red: " + red);

        String blue = "Blue String";
        System.out.println("Blue: " + blue);

        String purple = red + blue;
        System.out.println("Concatenation: " + purple);

        purple = "Purple String";
        System.out.println("Whoops! Mutation: " + purple);
    }
}
