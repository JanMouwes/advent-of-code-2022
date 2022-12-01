import qualified Spec.Day_1.Day_1Spec as Day_1

import Test.Tasty (defaultMain, testGroup, TestTree)
import Spec.Lib (toSimpleIOTest)

main :: IO ()
main = do
  defaultMain $ testGroup "Tests" [
        sanityCheck
      , Day_1.tests
    ]

sanityCheck :: TestTree
sanityCheck = toSimpleIOTest (True, True) id