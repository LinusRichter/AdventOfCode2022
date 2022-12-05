fs = require 'fs'
config = 'input_day_4.txt'

list = []

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")

counter = 0

for i in list
    firstElf = i.split(",")[0]
    secondElf = i.split(",")[1]
    firstMin = parseInt(firstElf.split("-")[0], 10)
    firstMax = parseInt(firstElf.split("-")[1], 10)
    secondMin = parseInt(secondElf.split("-")[0], 10)
    secondMax = parseInt(secondElf.split("-")[1], 10)
    firstArray = [firstMin..firstMax]
    secondArray = [secondMin..secondMax]

    isIn = false
    for k in firstArray
        if k in secondArray
            isIn = true
    if isIn
        counter++

console.log "AoC_Day4_Part2: " + counter
