package main.java;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author willsmith
 */
public class IntegerTypes {
    
    public static void intDemo()
    {
        byte myByte = -128;
        byte bigByte = 127;

        //Byte class
        Byte minByte = new Byte(myByte);
        Byte maxByte = new Byte("127");
        System.out.println(minByte); 
        System.out.println(bigByte);
        System.out.println(maxByte);
        
        short myShort = -32768;
        short bigShort = 32767;

        //Short class
        Short minShort = new Short(myShort);
        Short maxShort = new Short("32767");
        System.out.println(minShort); 
        System.out.println(bigShort);
        System.out.println(maxShort);
        
        int myInt = -2147483648;
        int bigInt = 2147483647;

        //Integer class
        Integer minInt = new Integer(myInt);
        Integer maxInt = new Integer("2147483647");
        System.out.println(minInt); 
        System.out.println(bigInt);
        System.out.println(maxInt);
        
        long myLong = -9223372036854775808L;
        long bigLong = 9223372036854775807L;

        //Long class
        Long minLong = new Long(myLong);
        Long maxLong = new Long("9223372036854775807");
        System.out.println(minLong); 
        System.out.println(bigLong);
        System.out.println(maxLong);

    }
}
