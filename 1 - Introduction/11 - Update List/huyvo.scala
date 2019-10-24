def f(arr: List[Int]): List[Int] = arr.map { x => if(x < 1)(-1 * x) else x}
