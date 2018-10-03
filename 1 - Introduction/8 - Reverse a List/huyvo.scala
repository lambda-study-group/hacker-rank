def f(arr:List[Int]):List[Int] = arr match {
  case h::t => f(t) ::: List(h)
  case Nil => Nil
}
