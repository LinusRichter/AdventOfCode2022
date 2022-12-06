fs = require 'fs'
config = 'input_day_1.txt'
list = []

foo = ->
  fs.readFileSync config, 'utf8'
test = foo()

list = test.split "\n"

curInv = []

most = 0
secmost = 0
thmost = 0

addUp = ->
  tmp = 0
  for i in curInv
    tmp += parseInt(i, 10)
  
  if tmp >= most
    thmost = secmost
    secmost = most
    most = tmp
  else if tmp >= secmost
    thmost = secmost
    secmost = tmp
  else if tmp >= thmost
    thmost = tmp
  else

for i in list
  if i.length == 0
    addUp()
    curInv = []
  else
    curInv.push i

console.log "AoC_Day1_Part1: most: " + most + " second: " + secmost + "third: " + thmost
console.log most + " + " + secmost + " + " + thmost +  " = " + (most + secmost + thmost)