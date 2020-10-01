import scala.io.StdIn.readInt

object Solution {
    val mod = 100000007

    def all(a0: BigInt, a1: BigInt, n: Int, acc: List[BigInt]): List[BigInt] = n match {
        case 0 => a0  :: acc
        case _ => all(a1, (a0+a1)%mod, n-1, a0::acc)
    }

    def main(args: Array[String]) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution */
        val l = List.fill(readInt)(readInt)
        val table = all(0, 1, l.max, Nil).reverse
        l.map(table).foreach(println)
    }
}
