rev lst = [ lst !! (length lst - index) | index <- [1..length lst] ]
