import benchy
import iterrr
import sugar
import std/sequtils

var acc = 0

timeIt "sequtils":
  for i in (1..1_000_000).toseq.
    filterit(it mod 2 == 0).
    filterit(it mod 4 == 0).
    filterit(it mod 8 == 0).
    filterit(it mod 16000 == 0).
    mapit(it div 16):

    acc.inc i

timeIt "iterrr":
  (1..1_000_000) |>
    filter(x => x mod 2 == 0).
    filter(x => x mod 4 == 0).
    filter(x => x mod 8 == 0).
    filter(x => x mod 16000 == 0).
    map(x => x div 16).
    each(i):

    acc.inc i

timeIt "iterrr-iter":
  (1..1_000_000) |>
    filter(x => x mod 2 == 0).
    filter(x => x mod 4 == 0).
    filter(x => x mod 8 == 0).
    filter(x => x mod 16000 == 0).
    map(x => x div 16).
    iter(myiter)

  for i in myiter():
    acc.inc i


timeIt "manual":
  for i in 1..1_000_000:
    if i mod 2 == 0:
      if i mod 4 == 0:
        if i mod 8 == 0:
          if i mod 16000 == 0:
            acc.inc i div 16


