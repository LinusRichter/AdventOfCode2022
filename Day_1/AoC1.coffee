fs = require 'fs'
config = 'input_day_1.txt'
list = []

foo = ->
  fs.readFileSync config, 'utf8'
test = foo()

list = test.split "\n"

curInv = []

ath = 0

addUp = ->
  tmp = 0
  for i in curInv
    tmp += parseInt(i, 10)
  
  if tmp > ath
    ath = tmp
  curInv = []

for i in list
  if i.length == 0
    addUp()
  else
    curInv.push i

console.log "AoC_Day1_Part1: " + ath




  
  


