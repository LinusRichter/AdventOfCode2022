fs = require 'fs'
config = 'input_day_6.txt'

list = []

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")
line = Array.from(list[0])
stack = line[0..3]

index = 0

hasDuplicates = ->
    return new Set(stack).size != stack.length

for i in [4..line.length - 1]
    stack = stack[1...]
    stack.push(line[i])
    if !hasDuplicates()
        console.log "AoC_Day6_Part1: " + (i + 1)
        return


    

    

    
