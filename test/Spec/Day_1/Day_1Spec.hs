module Spec.Day_1.Day_1Spec where

import Day_1.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 1" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [("1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000", 24000)]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [("1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000", 45000)]