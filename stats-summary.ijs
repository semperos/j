require 'tables/csv'
require 'stats/base/univariate'

NB. Sparser box formatting for easier table reading.
NB. Leading spaces throughout are due to making this
NB. line up headers with sub-tables.
(9!:7) ' -  -  -  -' NB. Use this if horizontal lines desired
(9!:7) '           ' NB. Default is blank table, only alignment provided

quartiles=:4&cile

summary=: monad define

  nums=:/:~y
  NB. For each value in `nums`, indicate which quartile it falls into,
  NB. 0 as first through 3 as fourth.
  qidx=:quartiles nums

  NB. Given a quartile 0 through 4, return the largest value
  NB. found in that quartile.
  max_q=: 3 : '>./ (nums #~ y&= qidx)'

  'q1 q2 q3 q4'=.max_q"0 (i.4)

  NB. Compact labels for easier cross-table comparison of data.
  headers=.'#';'Σ';'μ';'σ';'Min';'Q₁';'Med';'Q₃';<'Max'
  row=.(# nums);(+/ nums);(mean nums);(stddev nums);(<./ nums);q1;(median nums);q3;<(>./ nums)

  headers,.row

)

NB. Obviously point this at your local data file.
NB. Assumed to be a simple collection of numbers.
raw_nums=:readcsv '/Users/daniel/tmp/data.txt'
all_nums=:". ( , > raw_nums )
top_quarter_nums=:all_nums #~ 3&= (quartiles all_nums)
top_eighth_nums=:top_quarter_nums #~ 3&= (quartiles top_quarter_nums)
top_sixteenth_nums=:top_eighth_nums #~ 3&= (quartiles top_eighth_nums)

h=:'Overall';'Top Quarter';'Top Eighth';<'Top Sixteenth'
r=:(summary all_nums);(summary top_quarter_nums);(summary top_eighth_nums);<(summary top_sixteenth_nums)
|:h,.r
