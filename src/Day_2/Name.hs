module Day_2.Name where

import qualified Data.Map.Lazy as Map
import Data.Maybe (fromJust)

inputFile :: String
inputFile = "src/Day_2/input.txt"

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> Int
part1 = sum . map calcScore . parsePart1

part2 :: String -> Int
part2 = sum . map (calcScore . outcomeToRound) . parsePart2

parsePart1 :: String -> [(RPS, RPS)]
parsePart1 =  map (fromJust . parseLine) . filter (/="") . lines
  where
    parseLine ln =
      let [opp, own] = words ln
      in do
        opp' <- Map.lookup opp opponentMap
        own' <- Map.lookup own playerMap
        return (opp', own')

parsePart2 :: String -> [(RPS, Outcome)]
parsePart2 =  map (fromJust . parseLine) . filter (/="") . lines
  where
    parseLine ln =
      let [opp, own] = words ln
      in do
        opp' <- Map.lookup opp opponentMap
        own' <- Map.lookup own outcomeMap
        return (opp', own')

outcomeToRound :: (RPS, Outcome) -> (RPS, RPS)
outcomeToRound (left, Tie) = (left, left)
outcomeToRound (left, Win) = (left, getStronger left)
outcomeToRound (left, Loss) = (left, getWeaker left)

opponentMap :: Map.Map String RPS
opponentMap = Map.fromList [("A", Rock), ("B", Paper), ("C", Scissors)]

playerMap :: Map.Map String RPS
playerMap = Map.fromList [("X", Rock), ("Y", Paper), ("Z", Scissors)]

outcomeMap :: Map.Map String Outcome
outcomeMap = Map.fromList [("X", Loss), ("Y", Tie), ("Z", Win)]

calcScore :: (RPS, RPS) -> Int
calcScore round@(_, player) = outcomeScore (outcome round) + shapeScore player


outcome :: (RPS, RPS) -> Outcome
outcome (left, right) | left == right = Tie
outcome (left, right) | left `beats` right = Loss
outcome (left, right) | right `beats` left = Win
outcome inp = error ("unexpected input" ++ show inp)

outcomeScore :: Outcome -> Int
outcomeScore Win = 6
outcomeScore Tie = 3
outcomeScore Loss = 0

shapeScore :: RPS -> Int
shapeScore Rock = 1
shapeScore Paper = 2
shapeScore Scissors = 3


getWeaker :: RPS -> RPS
getWeaker Rock = Scissors
getWeaker Paper = Rock
getWeaker Scissors = Paper

getStronger :: RPS -> RPS
getStronger Rock = Paper
getStronger Paper = Scissors
getStronger Scissors = Rock

beats :: RPS -> RPS -> Bool
beats Rock Scissors = True
beats Rock Paper = False
beats Paper Rock = True
beats Paper Scissors = False
beats Scissors Paper = True
beats Scissors Rock = False
beats _ _ = False

data RPS = Rock | Paper | Scissors deriving (Show, Eq)
data Outcome = Win | Tie | Loss



