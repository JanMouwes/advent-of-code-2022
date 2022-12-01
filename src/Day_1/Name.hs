module Day_1.Name where

import Data.List.Split
import Data.List

inputFile :: String
inputFile = "src/Day_1/input.txt"

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> Int
part1 = maximum . map sum . parse

part2 :: String -> Int
part2 = sum . take 3 . reverse . sort . map sum . parse

parse :: String -> [[Int]]
parse raw = 
  let byElf = splitOn "\n\n" raw
  in map (map read . lines) byElf
