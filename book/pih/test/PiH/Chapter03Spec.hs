module PiH.Chapter03Spec (spec) where

import Test.Hspec
import qualified PiH.Chapter03 as My

spec :: Spec
spec = do

  describe "All" $ do
    it "passes" $ do
      True `shouldBe` True
