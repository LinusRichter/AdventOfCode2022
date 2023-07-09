fs = require 'fs'
config = 'input_day_9.txt'

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")

HeadPos = [0, 0]
TailPos = [0, 0]

uniqueTiles = new Set()
uniqueTiles.add(TailPos.toString())

distance = () ->
    x1 = HeadPos[0]
    y1 = HeadPos[1]
    x2 = TailPos[0]
    y2 = TailPos[1]
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2))

updateTail = ->
    if distance() >= 2
        if TailPos[0] == HeadPos[0]
            TailPos[1] = if TailPos[1] < HeadPos[1] then ++TailPos[1] else --TailPos[1]
        else if TailPos[1] == HeadPos[1]
            TailPos[0] = if TailPos[0] < HeadPos[0] then ++TailPos[0] else --TailPos[0]
        else
            up = TailPos[1] < HeadPos[1]
            right = TailPos[0] < HeadPos[0]
            TailPos[1] = if up then ++TailPos[1] else --TailPos[1]
            TailPos[0] = if right then ++TailPos[0] else --TailPos[0]

    uniqueTiles.add(TailPos.toString())
    

processMove = (move) ->
    move = move.split(" ")
    dir = move[0]
    steps = parseInt(move[1])
    
    for i in [1..steps]
        if dir == 'U'
            HeadPos[1]++
        else if dir == 'D'
            HeadPos[1]--
        else if dir == 'L'
            HeadPos[0]--
        else if dir == 'R'
            HeadPos[0]++
        updateTail()
    
list.forEach (x) ->
    processMove x

console.log "AoC_Day8_Part1: " + uniqueTiles.size