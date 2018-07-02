txt=.freads 'C:/Users/Daniel/Dev/j/j/aoc2017/day01/input.txt'
NB. Curtail line break, read as nums
data=:". ,. }:txt

$ data           NB. 2129
datatype {.data  NB. integer

NB.==========
NB.  Part I
NB.==========

NB. Find the sum of all digits that match the next digit in the list.

NB. Starting with small sample
]s=.10{.data
NB. 5 9 9 4 5 2 1 2 2 6
NB. So sum should be 9 + 2 == 11
+/ ((1|.s) = s) # s   NB. 11

NB. Now do it for the whole data set.
+/ ((1|.data) = data) # data NB. 1393 (correct)

NB.===========
NB.  Part II
NB.===========

NB. Do the same, but consider the digit halfway around the list.
]shiftage=.-:#data
datatype shiftage  NB. floating <-- can't use this for indexing
]shift=:<.shiftage
datatype shift     NB. integer  <-- tada!

NB. Same exact solution, just shift it by `shift` rather than 1
+/ ((shift|.data) = data) # data NB. 1292 (correct)

NB.================
NB.  Extra Credit
NB.================

NB. It's tacit time!

NB. Tacit version of Part I solution:
oneshift=.1&|.
sol1=:+/@:#(= oneshift)
sol1 data NB. 1393

NB. Tacit version of Part II solution:
halfshift=.(<.@-:@#) |. ]
sol2=:+/@:#(= halfshift)
sol2 data NB. 1292
