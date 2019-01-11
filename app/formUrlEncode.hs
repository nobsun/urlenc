module Main where

import Data.List
import Data.Maybe
import System.Environment
import Encode

main :: IO ()
main = putStr . formUrlEncode =<< maybe getLine (pure . fst) . uncons =<< getArgs

          
