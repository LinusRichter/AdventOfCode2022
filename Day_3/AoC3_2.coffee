fs = require 'fs'
config = 'input_day_3.txt'

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

for i in [0..list.length - 1] by 3
    for k in list[i]
        if k in list[i + 1]
            if k in list[i + 2]
                sum += evalPoints(k)
                break

console.log "AoC_Day3_Part2: " + sum
        