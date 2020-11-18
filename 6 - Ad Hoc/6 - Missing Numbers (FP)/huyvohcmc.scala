import scala.io.StdIn

object Solution {

    def main(args: Array[String]) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution */
        val (_, l1, _, l2) = (
            StdIn.readInt(),
            StdIn.readLine().split(" "),
            StdIn.readInt(),
            StdIn.readLine().split(" "),
        )
        l2.diff(l1).distinct.sorted.foreach(i => print(s"$i "))
    }
}
