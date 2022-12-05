module Spec.Day_5.Spec where

import Day_5.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 5" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [(testInput, "CMZ")]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [(testInput, "MCD")]

testInput :: String
testInput = "    [D]    \n[N] [C]    \n[Z] [M] [P]\n 1   2   3 \n\nmove 1 from 2 to 1\nmove 3 from 1 to 3\nmove 2 from 2 to 1\nmove 1 from 1 to 2"