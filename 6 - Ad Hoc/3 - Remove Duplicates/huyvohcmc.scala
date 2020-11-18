object Solution {

    def main(args: Array[String]) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution */
        println(scala.io.StdIn.readLine().foldLeft("")(
            (acc:String , x) => if (acc.contains(x)) acc else acc + x)
        )
    }
}
