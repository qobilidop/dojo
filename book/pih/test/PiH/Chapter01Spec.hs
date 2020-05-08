module PiH.Chapter01Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter01 as My

spec :: Spec
spec = do

-- Example 1
  describe "sum" $ do
    it "sums numbers" $ do
      My.sum [1, 2, 3] `shouldBe` 6

-- Example 2
  describe "qsort" $ do
    it "sorts numbers" $ do
      My.qsort [3, 5, 1, 4, 2] `shouldBe` [1, 2, 3, 4, 5]

-- Example 3
-- Don't know how to test this yet.

-- Exercise 3
  describe "product" $ do
    it "multiplies numbers" $ do
      My.product [2, 3, 4] `shouldBe` 24

-- Exercise 4
  describe "qsortReverse" $ do
    it "sorts numbers in reverse order" $ do
      My.qsortReverse [3, 5, 1, 4, 2] `shouldBe` [5, 4, 3, 2, 1]

-- Exercise 5
  describe "qsortUnique" $ do
    it "sorts numbers and removes duplicates" $ do
      My.qsortUnique [2, 2, 3, 1, 1] `shouldBe` [1, 2, 3]
