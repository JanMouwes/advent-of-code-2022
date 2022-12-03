module Utils.String where

nonEmptyLines :: String -> [String]
nonEmptyLines = filter (/="") . lines