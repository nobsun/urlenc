module Encode where

import Control.Arrow ((&&&))
import Data.ByteString.Lazy.UTF8 as BU8
import Data.ByteString.Base64.URL.Lazy as B64
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

base64urlEncode :: ByteString -> String
base64urlEncode = BU8.toString . B64.encode

formUrlEncode :: String -> String
formUrlEncode = encString False pred . map s2p
  where
    s2p c = case c of {' ' -> '+'; _ -> c}
    pred c = i > 0x1f
          && i < 0x7f
          && i /= 0x22
          && i /= 0x23
          && i /= 0x3c
          && i /= 0x3e
          && i /= 0x60
          && i /= 0x7b
          && i /= 0x7d
      where
        i = ord c
