fs = require 'fs'
config = 'input_day_5.txt'

list = []

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

result = ""

list = test.split("\n")
list = list[10...]

#depends on your puzzle-input
stacks = [["S", "C", "V", "N"],
          ["Z", "M", "J", "H", "N", "S"],
          ["M", "C", "T", "G", "J", "N", "D"],
          ["T", "D", "F", "J", "W", "R", "M"],
          ["P", "F", "H"],
          ["C", "T", "Z", "H", "J"],
          ["D", "P", "R", "Q", "F", "S", "L", "Z"],
          ["C", "S", "L", "H", "D", "F", "P", "W"],
          ["D", "S", "M", "P", "F", "N", "G", "Z"]]

for i in list
    line = i.split(" ")
    amount = parseInt(line[1], 10)
    fromStack = parseInt(line[3], 10) - 1
    toStack = parseInt(line[5], 10) - 1
    CratesInOrder = []

    for k in [1..amount]
        CratesInOrder.push(stacks[fromStack].pop())
    
    for j in CratesInOrder
        stacks[toStack].push(CratesInOrder.pop())

for k in [0..8]
    result += stacks[k].pop()

console.log "AoC_Day5_Part2: " + result