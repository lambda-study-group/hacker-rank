def f(arr:List[Int]):Int = arr match {
  case h::t => 1 + f(t)
  case Nil => 0
}
