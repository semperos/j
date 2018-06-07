NB. All the things I've needed

Note 'Locales'

NB. From LJ: http://www.jsoftware.com/help/learning/24.htm

NB. coname ''            show name of current locale
NB. conl 0               show names of all locales
NB. names ''             show all names in current locale
NB. nl ''                show all names in current locale (as a boxed list)
NB. cocurrent 'foo'      locale foo becomes current
NB. clear                'foo'remove all defns from locale foo
NB. coerase 'A';'B';'C'  erase locales A B and C
)

Note 'Input log (REPL history) for JQT'

NB. Under the ~/j64-806-user directory, search for
NB. MaxInputLog and set the value accordingly.

NB. --------------------------------------------------

NB. Width of console display

NB. Part of "Global Parameters" in the docs
NB. http://www.jsoftware.com/help/dictionary/dx009.htm
NB. 9!:36 y
NB. 9!:37 y	Output Control. A 4-element vector that controls session manager output:
NB.   0: end-of-line sequence   	0 line feed; 2 carriage return line feed
NB.   1: maximum line length	Output lines are truncated at this length and “...” appended.
NB.   2: maximum line before   	If the total number of output lines exceeds the sum of “maximum lines before” b and “maximum lines after” a , then the first b lines are output, followed by a line of “...”, followed by the last a lines.
NB.   3: maximum line after	See above.
NB. The defaults for output controls are 0 256 0 222 .

(9!:36)'' NB. 0 256 0 222
(9!:37) 0 20000 0 222
)

Note 'Boxes'

NB. 9!:6 y
NB. 9!:7 y    Box-Drawing Characters.
NB.           The eleven characters used to draw boxes
NB.           (9!:7) +++++++++|-
NB.           (9!:7) ┌┬┐├┼┤└┴┘│─
)

Note 'CSV'

load 'tables/csv'

readcsv '/path/to/your/csv.csv'
readtsv=:readdsv NB. It's the default, go figure.
)

Note 'Statistical verbs'

ntilebps=: 4 : 0
NB.* ntilebps: return breakpoint values of x-tiles of y; e.g. 4 ntilebps y
NB.  -> quartiles; 0-based so "1st" quartile is 0{4 ntilebps y.
   quant=. x
   y=. /:~y
   wh=. 0 1#:(i.quant)*quant%~#y  NB. Where partition points are exactly
   'n f'=. |:wh                    NB. whole and fractional part of partitions
   1|.+/"1 ((1-f),.f)*(n+/_1 0){y NB. "1|." moves top quantile to end.
)

quartiles=:4&ntilebps

)