

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import main.java.*;

/**
 *
 * @author William Smith
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("Hello, World!");
//        IntegerTypes.intDemo();
//        FloatTypes.floatDemo();
//        BooleanType.boolDemo();
//        StringType.stringDemo();
//        User u1 = new User("Will", 1);
//        User u2 = new User("Bob", 2);
//        User u3 = new User("Joe", 3);
//        User u4 = new User("Ron", 4);
//        User u5 = new User("Dorothy", 5);
//        LoggedInUserArray array = new LoggedInUserArray();
//
//        array.UserAuthenticated(u1);
//        array.UserAuthenticated(u2);
//        array.UserAuthenticated(u3);
//        array.UserAuthenticated(u4);
//
//        array.UserLoggedOut(u4);
//        array.UserAuthenticated(u5);

        int[] arr = {12, 11, 13, 5, 6, 9, 18, 110, 3, 14, 27, 8, 12, 0};

        ArraySortingAlgorithms algo = new ArraySortingAlgorithms();
//        algo.insertionSort(arr);
//        algo.selectionSort(arr);
//        algo.mergeSort(arr, 0, arr.length - 1);
//        algo.quickSort(arr, 0, arr.length - 1);
//        algo.bubbleSort(arr);
//        algo.BucketSort(arr, 110);
//        algo.CountingSort(arr);
//        algo.RadixSort(arr);

        for (int i : arr)
        {
            System.out.println(i);
        }
    }
    
}
