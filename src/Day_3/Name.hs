module Day_3.Name where

import qualified Data.Map.Lazy as Map

import Data.List (intersect)
import Data.Maybe (fromJust)
import Data.List.Split (chunksOf)
import Utils.String (nonEmptyLines)
import Utils.List (uniques)



inputFile :: String
inputFile = "src/Day_3/input.txt"

type Parsed = [(String, String)]

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> Int
part1 = sum . concatMap (map itemScore . findCommonItems) . parseToCompartments

part2 :: String -> Int
part2 = sum . concatMap (map itemScore . uniques . findCommonItems') . parseToGroups

parseToCompartments :: String -> Parsed
parseToCompartments = map (\bp -> splitAt (length bp `div` 2) bp) . nonEmptyLines

parseToGroups :: String -> [[String]]
parseToGroups = chunksOf 3 . nonEmptyLines

findCommonItems :: (String, String) -> String
findCommonItems = uniques . uncurry intersect

findCommonItems' :: [String] -> String
findCommonItems' = foldl1 intersect

itemScore :: Char -> Int
itemScore =
  let scores = Map.fromList $ zip (['a'..'z'] ++ ['A'..'Z']) [1..]
  in fromJust . (`Map.lookup` scores)
