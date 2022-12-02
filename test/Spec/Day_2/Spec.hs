module Spec.Day_2.Spec where

import Day_2.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 2" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [("A Y\nB X\nC Z", 15)]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [("A Y\nB X\nC Z", 12)]