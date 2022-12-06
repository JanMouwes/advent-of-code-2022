module Spec.Day_6.Spec where

import Day_6.Name (part1, part2)
import Test.Tasty (TestTree, testGroup)
import Spec.Lib (createIOTests)

tests :: TestTree
tests = testGroup "Day 6" [testPart1, testPart2]

testPart1 :: TestTree
testPart1 = createIOTests "Part 1" part1 [
    ("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 7)
  , ("bvwbjplbgvbhsrlpgdmjqwftvncz", 5)
  , ("nppdvjthqldpwncqszvftbrmjlhg", 6)
  , ("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 10)
  , ("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 11)
  ]

testPart2 :: TestTree
testPart2 = createIOTests "Part 2" part2 [
    ("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 19)
  , ("bvwbjplbgvbhsrlpgdmjqwftvncz", 23)
  , ("nppdvjthqldpwncqszvftbrmjlhg", 23)
  , ("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 29)
  , ("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 26)
  ]
