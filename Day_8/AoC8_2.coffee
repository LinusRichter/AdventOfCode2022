fs = require 'fs'
config = 'input_day_8.txt'

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")

highScore = 0

list = list.map (line) -> [...line]

countHorizontal = (ri, ci) ->
    
    score1 = 0
    for i in [ci..0]
        if ci == i
            continue
        if list[ri][i] < list[ri][ci]
            score1++
        if list[ri][i] >= list[ri][ci]
            score1++
            break

    score2 = 0
    for i in [ci..(list[ri].length - 1)]
        if ci == i
            continue
        if list[ri][i] < list[ri][ci]
            score2++
        if list[ri][i] >= list[ri][ci]
            score2++
            break

    return score1 * score2
  
countVertical = (ri, ci) ->

    score1 = 0
    for i in [ri..0]
        if ri == i
            continue
        if list[i][ci] < list[ri][ci]
            score1++
        if list[i][ci] >= list[ri][ci]
            score1++
            break

    score2 = 0
    for i in [ri..(list.length - 1)]
        if ri == i
            continue
        if list[i][ci] < list[ri][ci]
            score2++
        if list[i][ci] >= list[ri][ci]
            score2++
            break

    return score1 * score2
    

list.forEach (row, ri) ->
        row.forEach (column, ci) ->
            score = countHorizontal(ri, ci) * countVertical(ri, ci)
            highScore = Math.max highScore, score
            
console.log "AoC_Day8_Part2: " + highScore