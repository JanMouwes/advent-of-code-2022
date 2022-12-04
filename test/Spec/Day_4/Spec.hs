module Spec.Day_4.Spec where

import Day_4.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 4" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [(testInput, 2)]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [(testInput, 4)]

testInput :: String
testInput = "2-4,6-8\n2-3,4-5\n5-7,7-9\n2-8,3-7\n6-6,4-6\n2-6,4-8"