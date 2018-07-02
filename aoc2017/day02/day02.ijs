txt=.freads 'C:/Users/Daniel/Dev/j/j/aoc2017/day02/input.txt'
txt
NB. The file does not contain any negative numbers.
]data=:_1&". ;._2 txt

$ data         NB. 16 16
datatype data  NB. integer

NB.==========
NB.  Part I
NB.==========

NB. For each row, determine the difference between the largest
NB. value and the smallest value; the checksum is the sum of
NB. all of these differences.
rowsum=: monad define
  max=. >./ y
  min=. <./ y
  max - min
)
+/ rowsum data NB. 66215, which is incorrect...

NB. ^^^ Was wrong because you're trying to apply rowsum
NB. to the items of the table, so it worked row-wise.
NB. What you wanted was to apply it to each item (i.e.,
NB. each row), so you need to apply rowsum with rank 1.

+/ rowsum"1 data NB. 32121, which is correct

NB.===========
NB.  Part II
NB.===========

NB. Now rowsum, but find the only two numbers evenly divisible,
NB. divide them, and add up all of those results.
rowdivide=: monad define
NB. Division table for each row,
NB. only one coordinate has non-zero for both operands,
NB. so reshape the array to get those two operands
NB. (reverse each row, sort array, behead) and then divide,
NB. ensuring to: max(l) % min(l). That part could also be
NB. expressed with {.>.{: and {.<.{: since we know there
NB. are only two items per pair.
NB. There is certainly a better way, likely one that leverages
NB. a mathematical property I'm not thinking of.
(>./%<./){.|./:~(|."1 (0 = (y|/y)) # y) 
)

+/ rowdivide"1 data NB. 197, correct