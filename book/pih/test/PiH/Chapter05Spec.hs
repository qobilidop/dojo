module PiH.Chapter05Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter05 as My

spec :: Spec
spec = do

  describe "Exercise 1" $ do
    it "passes" $ do
      My.sumSquare 100 `shouldBe` 338350

  describe "Exercise 2" $ do
    it "passes" $ do
      My.grid 1 2 `shouldBe` [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]

  describe "Exercise 3" $ do
    it "passes" $ do
      My.square 2 `shouldBe` [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]

  describe "Exercise 4" $ do
    it "passes" $ do
      My.replicate 3 True `shouldBe` [True,True,True]

  describe "Exercise 5" $ do
    it "passes" $ do
      My.pyths 10 `shouldBe` [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]

  describe "Exercise 6" $ do
    it "passes" $ do
      My.perfects 500 `shouldBe` [6,28,496]

  describe "Exercise 7" $ do
    it "passes" $ do
      My.cartProd [1, 2] [3, 4] `shouldBe` [(x, y) | x <- [1, 2], y <- [3, 4]]

  describe "Exercise 8" $ do
    it "passes" $ do
      My.positions False [True, False, True, False] `shouldBe` [1,3]

  describe "Exercise 9" $ do
    it "passes" $ do
      My.scalarproduct [1,2,3] [4,5,6] `shouldBe` 32

  describe "Exercise 10" $ do
    it "passes" $ do
      My.encode 3 "Haskell is fun" `shouldBe` "Kdvnhoo lv ixq"
      My.encode (-3) "Kdvnhoo lv ixq" `shouldBe` "Haskell is fun"
      My.crack "Kdvnhoo lv ixq" `shouldBe` "Haskell is fun"
      My.crack "Vscd mywzboroxcsyxc kbo ecopev" `shouldBe` "List comprehensions are useful"
      My.crack (My.encode 3 "haskell") `shouldBe` "piasmtt"
      My.crack (My.encode 3 "boxing wizards jump quickly") `shouldBe` "wjsdib rduvmyn ephk lpdxfgt"
