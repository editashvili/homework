import java.util.*;
import java.io.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

class Person {
    protected String firstName;
    protected String lastName;
    protected int idNumber;

    // Constructor
    Person(String firstName, String lastName, int identification){
        this.firstName = firstName;
        this.lastName = lastName;
        this.idNumber = identification;
    }

    // Print person data
    public void printPerson(){
        System.out.println(
                "Name: " + lastName + ", " + firstName
                        + 	"\nID: " + idNumber);
    }

}

class Student extends Person{
    private int[] testScores;

    /*
     *   Class Constructor
     *
     *   @param firstName - A string denoting the Person's first name.
     *   @param lastName - A string denoting the Person's last name.
     *   @param id - An integer denoting the Person's ID number.
     *   @param scores - An array of integers denoting the Person's test scores.
     */

    Student(String firstName, String lastName, int identification, int[] scores){
        super(firstName, lastName, identification);
        testScores = scores;
    }

    /*
Calculates a Student object's average and returns the grade character representative of their calculated average:
Aakansha Doshi 7825621
4
31 32 34 35

should be grade T*/

    char calculate(){
        int sum = 0;
        for(int i = 0; i < testScores.length; i++){
            sum = sum + testScores[i];
        }
        int testScore = sum / testScores.length;

        if(testScore >=90 && testScore<=100 ){
            return 'O';
        }else if(testScore>=80 && testScore<90){
            return 'E';
        }else if(testScore>=70 && testScore<80){
            return 'A';
        }else if(testScore>=55 && testScore<70){
            return 'P';
        }else if(testScore>=40 && testScore<55){
            return 'D';
        }else{
            return 'T';
        }

    }
}

class Solution12 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String firstName = scan.next();
        String lastName = scan.next();
        int id = scan.nextInt();
        int numScores = scan.nextInt();
        int[] testScores = new int[numScores];
        for(int i = 0; i < numScores; i++){
            testScores[i] = scan.nextInt();
        }
        scan.close();

        Student s = new Student(firstName, lastName, id, testScores);
        s.printPerson();
        System.out.println("Grade: " + s.calculate());
    }
}
