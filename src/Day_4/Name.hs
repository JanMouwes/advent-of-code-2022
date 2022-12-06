module Day_4.Name (run, part1, part2) where
import Utils.String (nonEmptyLines)
import Utils.List (splitOnFirst)
import Data.Bifunctor (bimap)

inputFile :: String
inputFile = "src/Day_4/input.txt"

type Section = (Int, Int)

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> Int
part1 = length . filter (\(left, right) -> left `contains` right || right `contains` left) . parse

part2 :: String -> Int
part2 = length . filter (\(left, right) -> left `hasOverlap` right || right `hasOverlap` left) . parse

parse :: String -> [(Section, Section)]
parse = map (bimap parsePair parsePair . (`splitOnFirst` ',')) . nonEmptyLines
  where parsePair = bimap read read . (`splitOnFirst` '-')

contains :: Section -> Section -> Bool
contains (leftA, leftZ) (rightA, rightZ) = leftA <= rightA && leftZ >= rightZ

hasOverlap :: Section -> Section -> Bool
hasOverlap (leftA, leftZ) (rightA, rightZ) = 
  leftZ >= rightA && leftZ <= rightZ || leftA >= rightA && leftA <= rightZ
