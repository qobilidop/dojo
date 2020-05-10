module PiH.Chapter04Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter04 as My

spec :: Spec
spec = do

  describe "Exercise 1" $ do
    it "passes" $ do
      My.halve [1, 2, 3, 4, 5, 6] `shouldBe` ([1, 2, 3], [4, 5, 6])

  describe "Exercise 2" $ do
    it "passes" $ do
      My.thirdA [1, 2, 3, 4] `shouldBe` 3
      My.thirdB [1, 2, 3, 4] `shouldBe` 3
      My.thirdC [1, 2, 3, 4] `shouldBe` 3

  describe "Exercise 3" $ do
    it "passes" $ do
      My.safetailA [1, 2, 3, 4] `shouldBe` [2, 3, 4]
      My.safetailB [1, 2, 3, 4] `shouldBe` [2, 3, 4]
      My.safetailC [1, 2, 3, 4] `shouldBe` [2, 3, 4]
      -- TODO: Fix these tests
      -- My.safetailA [] `shouldBe` []
      -- My.safetailB [] `shouldBe` []
      -- My.safetailC [] `shouldBe` []

  describe "Exercise 8" $ do
    it "passes" $ do
      My.luhnDouble 3 `shouldBe` 6
      My.luhnDouble 6 `shouldBe` 3
      My.luhn 1 7 8 4 `shouldBe` True
      My.luhn 4 7 8 3 `shouldBe` False
