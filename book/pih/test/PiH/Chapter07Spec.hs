module PiH.Chapter07Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import qualified PiH.Chapter07 as My

spec :: Spec
spec = do

  describe "Exercise 1" $ do
    it "passes" $ do
      My.mapFilter (+1) even [1,2,3,4] `shouldBe` [3,5]

  describe "Exercise 2" $ do
    it "passes" $ do
      My.all even [2,4,6,8] `shouldBe` True
      My.any odd [2,4,6,8] `shouldBe` False
      My.takeWhile even [2,4,6,7,8] `shouldBe` [2,4,6]
      My.dropWhile odd [1,3,5,6,7] `shouldBe` [6,7]

  describe "Exercise 3" $ do
    it "passes" $ do
      My.map' even [1,2,3,4] `shouldBe` [False,True,False,True]
      My.filter' even [1..10] `shouldBe` [2,4,6,8,10]

  describe "Exercise 4" $ do
    it "passes" $ do
      My.dec2int [2,3,4,5] `shouldBe` 2345

  describe "Exercise 5" $ do
    it "passes" $ do
      My.curry (\(x, y) -> x + y) 1 2 `shouldBe` 3
      My.uncurry (\x y -> x + y) (1, 2) `shouldBe` 3

  describe "Exercise 6" $ do
    it "passes" $ do
      My.chop8 [1,0,0,0,0,1,1,0,0,1,0,0,0,1,1,0] `shouldBe` [[1,0,0,0,0,1,1,0],[0,1,0,0,0,1,1,0]]
      My.map'' even [1,2,3,4] `shouldBe` [False,True,False,True]
      take 3 (My.iterate (+1) 1) `shouldBe` [1,2,3]

  describe "Exercise 7" $ do
    it "passes" $ do
      My.transmit "higher-order functions are easy" `shouldBe` "higher-order functions are easy"

  describe "Exercise 8" $ do
    it "passes" $ do
      evaluate (My.transmitFaulty "abc") `shouldThrow` errorCall "parity error"

  describe "Exercise 9" $ do
    it "passes" $ do
      My.altMap (+10) (+100) [0,1,2,3,4] `shouldBe` [10,101,12,103,14]

  describe "Exercise 10" $ do
    it "passes" $ do
      My.luhn [1,7,8,4] `shouldBe` True
      My.luhn [4,7,8,3] `shouldBe` False
