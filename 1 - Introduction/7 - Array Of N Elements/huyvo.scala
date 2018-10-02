object Solution extends App {
  def f(num:Int) : List[Int] = {
    if (num == 0) return List();
    return List(1) ::: f(num - 1);
  }

  println(f(readInt))
}
