module Day_1.Name where

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


part1 :: String -> String
part1 = undefined . parse

part2 :: String -> String
part2 = undefined . parse

parse :: String -> String
parse = undefined
