
package main.java;
/**
 * Created by willsmith on 8/11/16.
 */
public class BooleanType
{
    public static void boolDemo()
    {
        //Java
        boolean a = true;
        boolean b = false;
        boolean c = a;

        System.out.println("a: " + a);
        System.out.println("b: " + b);
        System.out.println("c: " + c);
        System.out.println("a AND b: " + (a && b));
        System.out.println("a OR b: " + (a || b));
        System.out.println("NOT a: " + !a);
        System.out.println("NOT b: " + !b);
        System.out.println("a XOR b: " + (a ^ b));
        System.out.println("(c OR b) AND a: " + ((c || b) && a));
    }
}
