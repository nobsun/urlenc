module Encode where

import Control.Arrow ((&&&))
import Data.Char
import Data.Maybe
import Network.URL

percentEncode :: String -> String
percentEncode = encString False pred
  where
    pred c = i > 0x1f
          && i < 0x7f
          && i /= 0x20
          && i /= 0x22
          && i /= 0x23
          && i /= 0x3c
          && i /= 0x3e
          && i /= 0x60
          && i /= 0x7b
          && i /= 0x7d
      where
        i = ord c

sample = "https://scrapbox.io/api/pages/ny-sketch-book/はじめに すこし"
 
