module PiH.Chapter02Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter02 as My

spec :: Spec
spec = do

  describe "Exercise 3" $ do
    it "passes n" $ do
      My.n `shouldBe` 2

  describe "Exercise 4" $ do
    it "passes last1" $ do
      My.last1 [1, 2, 3, 4, 5] `shouldBe` 5
    it "passes last2" $ do
      My.last2 [1, 2, 3, 4, 5] `shouldBe` 5

  describe "Exercise 5" $ do
    it "passes init1" $ do
      My.init1 [1, 2, 3, 4, 5] `shouldBe` [1, 2, 3, 4]
    it "passes init2" $ do
      My.init2 [1, 2, 3, 4, 5] `shouldBe` [1, 2, 3, 4]
