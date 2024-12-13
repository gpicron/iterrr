iterator ritems*[T](o: openArray[T]): lent T =
  for i in countdown(o.high, o.low):
    yield o[i]

iterator rpairs*[T](o: openArray[T]): (int, lent T) =
  for i in countdown(o.high, o.low):
    yield (i, o[i])

iterator mritems*[T](o: var openArray[T]): var T =
  for i in countdown(o.high, o.low):
    yield o[i]

iterator mrpairs*[T](o: var openArray[T]): (int, var T) =
  for i in countdown(o.high, o.low):
    yield (i, o[i])

iterator just*[T](args: varargs[T]): T =
  when varargsLen(args) == 1:
    let e = args[0]
    yield e
  else:
    for e in args:
      yield e