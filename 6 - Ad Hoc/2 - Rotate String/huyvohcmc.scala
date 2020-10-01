object Solution {

    def main(args: Array[String]) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution*/
        val lines = io.Source.stdin.getLines().drop(1)
        println(lines.map(x => x.scanLeft(x)((t,_) => t.tail + t.head).drop(1).mkString(" ")).mkString("\n"))
    }
}
