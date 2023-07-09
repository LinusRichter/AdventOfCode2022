fs = require 'fs'
config = 'input_day_8.txt'

foo = ->
    fs.readFileSync config, 'utf8'
test = foo()

list = test.split("\n")
                 
count = 0

testInput = ["30373",
             "25512",
             "65332",
             "33549",
             "35390"]

list = testInput

list = list.map (line) -> [...line]

checkRow = (ri, ci) ->
    visible = true
    final = false
    list[ri].forEach (cell, cellIndex) ->
        if cellIndex == ci
            if visible
                final = true
            visible = true
        if (cell >= list[ri][ci]) && (cellIndex != ci)
            visible = false
        if ci == (list[ri].length - 1)
            final = true
    return visible || final
    
checkColumn = (ri, ci) ->
    visible = true
    final = false
    list.forEach (row, rowIndex) ->
        if rowIndex == ri
            if visible
                final = true
            visible = true
        if (row[ci] >= list[ri][ci]) && (rowIndex != ri)
            visible = false
        if ri == (list.length - 1)
            final = true
    return visible || final

list.forEach (row, ri) ->
        row.forEach (column, ci) ->
            if (checkRow(ri, ci) || checkColumn(ri, ci))
                count++

 console.log "AoC_Day8_Part1: " + count