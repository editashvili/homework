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


public class Solution11 {
    static int n = 6;

    static int findMaxSum(int [][]myArray){

        int max_sum = Integer.MIN_VALUE;

        for (int i = 0; i < n - 2; i++){
            for (int j = 0; j < n - 2; j++){
                int sum = (myArray[i][j] + myArray[i][j + 1] +
                        myArray[i][j + 2]) + (myArray[i + 1][j + 1]) +
                        (myArray[i + 2][j] + myArray[i + 2][j + 1] +
                                myArray[i + 2][j + 2]);

                max_sum = Math.max(max_sum, sum);
            }
        }
        return max_sum;
    }


    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        List<List<Integer>> arr = new ArrayList<>();

        IntStream.range(0, 6).forEach(i -> {
            try {
                arr.add(
                        Stream.of(bufferedReader.readLine().replaceAll("\\s+$", "").split(" "))
                                .map(Integer::parseInt)
                                .collect(toList())
                );
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        });
        bufferedReader.close();

        int[][] myArray = new int[n][n];

        for (int i = 0; i < arr.size(); i++) {
            for (int j = 0; j < arr.size(); j++) {
                myArray[i][j] = (arr.get(i).get(j));
                //System.out.print(myArray[i][j]);
            }
            //System.out.println();
        }

        int maxSumFinal = findMaxSum(myArray);
        System.out.println(maxSumFinal);
    }
}