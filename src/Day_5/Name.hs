module Day_5.Name where
import qualified Data.Map.Lazy as Map
import Data.Bifunctor (bimap, Bifunctor (first))
import Text.Parsec
import Text.Parsec.String
import Data.List (transpose)
import Data.Char (isDigit)
import Data.Maybe (fromJust)

inputFile :: String
inputFile = "src/Day_5/input.txt"

type CrateMap = Map.Map Int [Crate]
type Parsed = (CrateMap, [Move])
type Crate = Char
type Move = (Int, Int, Int)

run :: IO ()
run = do
  inputStr <- readFile inputFile
  putStrLn ("read input from " ++ inputFile)

  putStrLn "Part 1:"
  print $ part1 inputStr

  putStrLn "Part 2:"
  print $ part2 inputStr


part1 :: String -> String
part1 str =
  let (crates, moves) = parse' str
  in map head $ Map.elems $ executeMoves crates moves

executeMoves :: CrateMap -> [Move] -> CrateMap
executeMoves = foldl executeMove
  where
    executeMove :: CrateMap -> Move -> CrateMap
    executeMove cMap (amt, from, to) = fromJust $ do
      fromStack <- from `Map.lookup` cMap
      toStack <- to `Map.lookup` cMap
      return $ Map.insert to (reverse (take amt fromStack) ++ toStack)
             $ Map.insert from (drop amt fromStack) cMap


part2 :: String -> String
part2 str = 
  let (crates, moves) = parse' str
  in map head $ Map.elems $ executeMoves' crates moves


executeMoves' :: CrateMap -> [Move] -> CrateMap
executeMoves' = foldl executeMove
  where
    executeMove :: CrateMap -> Move -> CrateMap
    executeMove cMap (amt, from, to) = fromJust $ do
      fromStack <- from `Map.lookup` cMap
      toStack <- to `Map.lookup` cMap
      return $ Map.insert to (take amt fromStack ++ toStack)
             $ Map.insert from (drop amt fromStack) cMap

parse' :: String -> Parsed
parse' = bimap parseCrates (parseMoves . tail) . span (/="") . lines

parseCrates :: [String] -> Map.Map Int [Crate]
parseCrates =
  Map.fromList . map (bimap read (reverse . filter (/=' ')) . span isDigit)
               . filter ((/= ' ') . head)
               . map reverse
               . transpose


parseMoves :: [String] -> [Move]
parseMoves = map (fromRight . parse parseMove "") . filter (/="")

parseMove :: Parser Move
parseMove = do
  a <- string "move " *> many1 digit
  b <- string " from " *> many1 digit
  c <- string " to " *> many1 digit
  return (read a, read b, read c)

fromRight :: Show a => Either a b -> b
fromRight (Right b) = b
fromRight (Left a) = error ("unexpected Left: " ++ show a)