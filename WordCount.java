import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import scala.Tuple2;

import java.util.Arrays;

public class WordCount {
    public static void main(String[] args) {
        // Check for correct number of arguments
        if (args.length < 2) {
            System.err.println("Usage: WordCount <input-file> <output-file>");
            System.exit(1);
        }

        String inputFile = args[0];
        String outputFile = args[1];

        SparkConf conf = new SparkConf().setAppName("WordCount");
        JavaSparkContext sc = new JavaSparkContext(conf);

        // Start timer
        long startTime = System.currentTimeMillis();

        // The core WordCount logic remains the same
        JavaRDD<String> textFile = sc.textFile(inputFile);
        JavaPairRDD<String, Integer> counts = textFile
                .flatMap(s -> Arrays.asList(s.split(" ")).iterator())
                .mapToPair(word -> new Tuple2<>(word, 1))
                .reduceByKey((a, b) -> (a+b));

        // Save the result
        counts.map(t -> t._1() + "\t" + t._2()).saveAsTextFile(outputFile);


        // Print execution time
        long endTime = System.currentTimeMillis();
        System.out.println("=====================================================");
        System.out.println("Total execution time: " + ((endTime - startTime) / 1000) + " s");
        System.out.println("=====================================================");

        sc.stop();
    }
}
