module PiH.Chapter01Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter01 as My

spec :: Spec
spec = do

  describe "Exercise 3" $ do
    it "passes product" $ do
      My.product [2, 3, 4] `shouldBe` 24

  describe "Exercise 4" $ do
    it "passes qsortReverse" $ do
      My.qsortReverse [3, 5, 1, 4, 2] `shouldBe` [5, 4, 3, 2, 1]

  describe "Exercise 5" $ do
    it "passes qsortUnique" $ do
      My.qsortUnique [2, 2, 3, 1, 1] `shouldBe` [1, 2, 3]
