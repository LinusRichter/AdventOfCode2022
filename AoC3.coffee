fs = require 'fs'
config = 'input_day_3.txt'
#config = 'test.txt'
list = []

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")

sum = 0

evalPoints = (x) ->
    if(/^[A-Z]*$/.test(x))
        return x.charCodeAt(0) - 64 + 26
    else if(/^[a-z]*$/.test(x))
        return x.charCodeAt(0) - 96
for i in list
    m = i.length / 2
    left = i[0..(m - 1)]
    right = i[m...]
    console.log left + " : " + right
    for l in left
        if l in right
            sum += evalPoints(l)
            break

console.log "AoC_Day3_Part1: " + sum

   