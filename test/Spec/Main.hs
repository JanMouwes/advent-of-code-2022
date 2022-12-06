import qualified Spec.Day_1.Spec as Day_1
import qualified Spec.Day_2.Spec as Day_2
import qualified Spec.Day_3.Spec as Day_3
import qualified Spec.Day_4.Spec as Day_4
import qualified Spec.Day_5.Spec as Day_5
import qualified Spec.Day_6.Spec as Day_6

import Test.Tasty (defaultMain, testGroup, TestTree)
import Spec.Lib (toSimpleIOTest)

main :: IO ()
main = do
  defaultMain $ testGroup "Tests" [
        sanityCheck
      , Day_1.tests
      , Day_2.tests
      , Day_3.tests
      , Day_4.tests
      , Day_5.tests
      , Day_6.tests
    ]

sanityCheck :: TestTree
sanityCheck = toSimpleIOTest (True, True) id