module PiH.Chapter06Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import qualified PiH.Chapter06 as My

spec :: Spec
spec = do

  describe "Exercise 1" $ do
    it "passes" $ do
      My.fac 3 `shouldBe` 6
      evaluate (My.fac (-1)) `shouldThrow` errorCall "invalid argument"

  describe "Exercise 2" $ do
    it "passes" $ do
      My.sumdown 3 `shouldBe` 6

  describe "Exercise 3" $ do
    it "passes" $ do
      2 My.^ 3 `shouldBe` 8

  describe "Exercise 4" $ do
    it "passes" $ do
      My.euclid 6 27 `shouldBe` 3

  describe "Exercise 7" $ do
    it "passes" $ do
      My.merge [1,2,3] [4,5,6] `shouldBe` [1,2,3,4,5,6]

  describe "Exercise 8" $ do
    it "passes" $ do
      My.msort [3,2,1,4] `shouldBe` [1,2,3,4]
