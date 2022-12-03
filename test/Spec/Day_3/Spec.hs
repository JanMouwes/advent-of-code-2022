module Spec.Day_3.Spec where

import Day_3.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 3" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [(testInput, 157)]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [(testInput, 70)]

testInput :: String
testInput = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw"