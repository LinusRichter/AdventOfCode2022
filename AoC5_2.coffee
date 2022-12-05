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
one = ["S", "C", "V", "N"]
two = ["Z", "M", "J", "H", "N", "S"]
three = ["M", "C", "T", "G", "J", "N", "D"]
four = ["T", "D", "F", "J", "W", "R", "M"]
five = ["P", "F", "H"]
six = ["C", "T", "Z", "H", "J"]
seven = ["D", "P", "R", "Q", "F", "S", "L", "Z"]
eight = ["C", "S", "L", "H", "D", "F", "P", "W"]
nine = ["D", "S", "M", "P", "F", "N", "G", "Z"]

intToArray = new Map
intToArray.set 1, one
intToArray.set 2, two
intToArray.set 3, three
intToArray.set 4, four
intToArray.set 5, five
intToArray.set 6, six
intToArray.set 7, seven
intToArray.set 8, eight
intToArray.set 9, nine

for i in list
    line = i.split(" ")
    amount = parseInt(line[1], 10)
    fromStack = parseInt(line[3], 10)
    toStack = parseInt(line[5], 10)
    CratesInOrder = []

    for k in [1..amount]
        CratesInOrder.push(intToArray.get(fromStack).pop())
    
    for j in CratesInOrder
        intToArray.get(toStack).push(CratesInOrder.pop())

for k in [1..9]
    result += intToArray.get(k).pop()

console.log "AoC_Day5_Part2: " + result