module Spec.Lib where
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

toSimpleIOTest :: (Show a, Eq a, Show b, Eq b) => (a, b) -> (a -> b) -> TestTree
toSimpleIOTest (input, expected) fn =
  let actual = fn input
      assertion = assertEqual (show expected) expected actual
      cutoff = 35
      shorten maxSize str 
        | length str <= maxSize = str
        | otherwise = take (maxSize - 3) str ++ "..."
  in testCase (shorten cutoff (show input) ++ " yields " ++ shorten cutoff (show expected)) assertion


createIOTests  :: (Show a, Eq a, Show b, Eq b) => String -> (a -> b) -> [(a, b)] -> TestTree
createIOTests name fn = testGroup name . map (`toSimpleIOTest` fn)


