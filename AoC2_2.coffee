fs = require 'fs'
config = 'input_day_2.txt'
list = []

foo = ->
  fs.readFileSync config, 'utf8'
test = foo()

list = test.split "\n"
list.pop

totalScore = 0

#Op
# A = Rock
# B = Paper
# C = Scissors

# X = lose 0
# Y = draw 3
# z = win 6

# Rock = 1
# Paper = 2
# Scissors = 3

cond = new Map
cond.set "A X", 3
cond.set "A Y", 4
cond.set "A Z", 8

cond.set "B X", 1
cond.set "B Y", 5
cond.set "B Z", 9

cond.set "C X", 2
cond.set "C Y", 6
cond.set "C Z", 7

for i in list
    totalScore += cond.get(i)

console.log "AoC_Day2_Part2: " + totalScore