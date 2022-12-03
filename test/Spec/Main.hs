import qualified Spec.Day_1.Spec as Day_1
import qualified Spec.Day_2.Spec as Day_2
import qualified Spec.Day_3.Spec as Day_3

import Test.Tasty (defaultMain, testGroup, TestTree)
import Spec.Lib (toSimpleIOTest)

main :: IO ()
main = do
  defaultMain $ testGroup "Tests" [
        sanityCheck
      , Day_1.tests
      , Day_2.tests
      , Day_3.tests
    ]

sanityCheck :: TestTree
sanityCheck = toSimpleIOTest (True, True) id