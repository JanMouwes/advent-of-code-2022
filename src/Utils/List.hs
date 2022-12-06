module Utils.List where

import qualified Data.Set as Set
import qualified Data.Sequence as Seq
import Data.Foldable (toList)
import Data.Sequence ((|>))

-- | If the given list is prefixed by the given prefix, it will return the remainder. 
--   Otherwise, it will return Nothing
consumePrefix :: Eq a => [a] -> [a] -> Maybe [a]
consumePrefix str prefix
    | str `hasPrefix` prefix = Just $ drop (length prefix) str
    | otherwise = Nothing

-- | Checks if a given list has a specified prefix.
hasPrefix :: Eq a => [a] -> [a] -> Bool
hasPrefix str prefix = take (length prefix) str == prefix

-- | If the given list is prefixed by the given prefix, it will return the remainder. 
--   Otherwise, it will return Nothing
consumePostfix :: Eq a => [a] -> [a] -> Maybe [a]
consumePostfix str fix
    | str `hasPostfix` fix = Just $ take (length str - length fix) str
    | otherwise = Nothing

-- | Checks if a given list has a specified prefix.
hasPostfix :: Eq a => [a] -> [a] -> Bool
hasPostfix str fix = drop (length str - length fix) str == fix

-- | Splits the list on the first occurrence of a specified element.
splitOnFirst :: Eq a => [a] -> a -> ([a], [a])
splitOnFirst [] _ = ([], [])
splitOnFirst xs x = (takeWhile (/=x) xs, drop 1 $ dropWhile (/=x) xs)

splitOnElement :: Eq a => [a] -> a -> [[a]]
splitOnElement [] _ = [[]]
splitOnElement xs x = 
  let (with, out) = span (/= x) xs
  in (with : splitOnElement (tail out) x)

compareBy :: Ord b => (a -> b) -> a -> a -> Ordering
compareBy f x y = f x `compare` f y

without :: Ord a => [a] -> [a] -> [a]
without xs ys = filter (`notElem` ys) xs

uniques :: Ord a => [a] -> [a]
uniques = Set.toList . Set.fromList



-- https://stackoverflow.com/a/27727244
windows :: Int -> [a] -> [[a]]
windows n0 = go 0 Seq.empty
  where
    go n s (a:as) | n' <  n0   =              go n' s'  as
                  | n' == n0   = toList s'  : go n' s'  as
                  | otherwise =  toList s'' : go n  s'' as
      where
        n'  = n + 1         -- O(1)
        s'  = s |> a        -- O(1)
        s'' = Seq.drop 1 s' -- O(1)
    go _ _ [] = []