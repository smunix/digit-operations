module Main where

import System.Console.Haskeline
import Text.Read (readMaybe)
import Lib

main :: IO ()
main = runInputT defaultSettings loop
  where
    loop = do
      minput <- getInputLine "> "
      case minput of
        Nothing -> return ()
        Just "quit()" -> return ()
        Just "quit" -> return ()
        Just "q" -> return ()
        Just input -> case (readMaybe input) of
          Nothing -> do
            outputStrLn $ input ++ " is not a number ... try again ..."
            loop
          Just v -> do
            outputStrLn . unlines $ (fmap (\x -> x ++ "="++(show v)) . filterExprs) (== v)
            loop
