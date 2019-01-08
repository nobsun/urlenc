module Main where

import Data.List
import Data.Maybe
import System.Environment
import Encode

main :: IO ()
main = putStr . percentEncode =<< maybe getLine (pure . fst) . uncons =<< getArgs
  
          
