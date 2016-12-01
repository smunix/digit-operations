{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
module Lib
    ( expandExpr
    , allExprs
    , filterExprs
    , Eval(..)
    , Digit, Number, Term, Expr,
    ) where

import Control.Monad (join)
import Data.List (intercalate)

{-
Lazily build the list of all expressions,
starting with an empty expression. This is
done by expansion of a list of expressions,
the list of which starts as  empty and is expanded
progressively into what looks like a "linear" catamorphism.

See the code below for details.
-}

-- some type aliases
type Digit  = Int      -- a digit is a primitive int in the range [1-9]
type Number = [Digit]  -- a number is a list of digits
type Term   = [Number] -- a term is a list (multiplication <-> *) of numbers
type Expr   = [Term]   -- an expression is a list (addition <-> +) of terms

-- a class for things that can be evaluated into integer values
class Eval t where
  eval :: t -> Int

-- evaluate a number to its int value
instance Eval Number where
  eval = foldl1 (\a -> \d -> a*10 + d)

-- evaluate a term to its int value
instance Eval Term where
  eval = product . fmap eval

-- evaluate an expression to its int value
instance Eval Expr where
  eval = sum . fmap eval

-- given a list of expressions, add a digit at the front of each
expandExpr :: Digit -> [Expr] -> [Expr]
expandExpr dgt [] = [[[[dgt]]]]
expandExpr dgt exs = join . fmap (addDigit dgt) $ exs
  where
     -- given an expression, add a digit at its front
    addDigit :: Digit -> Expr -> [Expr]
    addDigit d ((number:numbers):terms) =
      [
        -- add d as a digit at the left of the current number, to make a longer number (e.g. d=1, current number = 2 <=> 12)
        ((d:number):numbers):terms,
        -- or add a digit d as a separate new number in the current term (e.g. d=2, current term = 34 <=> 2*34)
        ([d]:number:numbers):terms,
        -- or add a digit d as a separate new term in the expression (e.g. d=2, expression = 3+4 <=> 2+3+4)
        [[d]]:(number:numbers):terms
      ]
    addDigit _ [] = error "addDigit on empty expression"
    addDigit _ ([]:_) = error "addDigit on empty term"

-- all possible expressions (lazily generated, so perf shouldn't be an issue)
allExprs :: [Expr]
allExprs = foldr expandExpr [] [1..9]

-- list as stings all expressions that matches a filtering criteria
filterExprs :: (Int -> Bool) -> [String]
filterExprs f = asString filteredExprs
  where
    filteredExprs = filter (f . eval) allExprs
    asString = fmap (intercalate "+" . fmap (intercalate "x" . fmap (show . eval)))
