module Day_6.Name where

import Data.List (nub)
import Utils.List (windows)

inputFile :: String
inputFile = "src/Day_6/input.txt"

type Parsed = String

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> Int
part1 str =
  let wins = takeWhile (\l -> l /= nub l) . windows 4
  in 1 + length (foldl1 (\agg win -> agg ++ [last win]) $ wins str)

part2 :: String -> Int
part2 str =
  let wins = takeWhile (\l -> l /= nub l) . windows 14
  in 1 + length (foldl1 (\agg win -> agg ++ [last win]) $ wins str)

parse :: String -> Parsed
parse = id
