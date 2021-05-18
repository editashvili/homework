import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

/*n - single integer.
Print a single base-10 integer that denotes the maximum number of consecutive 1's in the binary representation of n.*/


public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bufferedReader.readLine().trim());
        int countDecimalOne = 0;

        if (n == 0) {
            String binary = "0";
        }
        String binary = "";
        while (n > 0) {
            int rem = n % 2;
            binary = rem + binary;
            n = n / 2;
        }

        System.out.println(binary);
        int length = binary.length();
        char[] array = binary.toCharArray();

        int finalAnswer = 0;
        for (int i = 0; i < length; i++) {
            countDecimalOne = 0;
            if (array[i] == '1'){
                for (int j = i; j < length; j++) {
                    if (array[j] == '1') {
                        countDecimalOne = countDecimalOne + 1;
                    } else {
                        break;
                    }
                }
            }

            if (countDecimalOne > finalAnswer){
                finalAnswer = countDecimalOne;
            }
        }
        System.out.println(finalAnswer);
        bufferedReader.close();
    }

}

