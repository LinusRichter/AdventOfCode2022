fs = require 'fs'
config = 'input_day_9.txt'

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")

rope = [[0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0]]



uniqueTiles = new Set()
uniqueTiles.add(rope[9].toString())

distance = (index) ->
    x1 = rope[index][0]
    y1 = rope[index][1]
    x2 = rope[index + 1][0]
    y2 = rope[index + 1][1]
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2))

updateTail = (index) ->
    if distance(index) >= 2

        if rope[index + 1][0] == rope[index][0]
            rope[index + 1][1] = if rope[index + 1][1] < rope[index][1]
            then ++rope[index + 1][1]
            else --rope[index + 1][1]
        else if rope[index + 1][1] == rope[index][1]
            rope[index + 1][0] = if rope[index + 1][0] < rope[index][0]
            then ++rope[index + 1][0]
            else --rope[index + 1][0]
        else
            up = rope[index + 1][1] < rope[index][1]
            right = rope[index + 1][0] < rope[index][0]
            rope[index + 1][1] = if up then ++rope[index + 1][1] else --rope[index + 1][1]
            rope[index + 1][0] = if right then ++rope[index + 1][0] else --rope[index + 1][0]

    uniqueTiles.add(rope[9].toString())
    

processMove = (move) ->
    move = move.split(" ")
    dir = move[0]
    steps = parseInt(move[1])
    
    for i in [1..steps]
        if dir == 'U'
            rope[0][1]++
        else if dir == 'D'
            rope[0][1]--
        else if dir == 'L'
            rope[0][0]--
        else if dir == 'R'
            rope[0][0]++
        for k in [0..8]
            updateTail(k)
    
list.forEach (x) ->
    processMove x

console.log "AoC_Day8_Part2: " + uniqueTiles.size