module Main where

import Attributes
import Prelude (Unit, ($))

import Data.Variant (inj)
import Effect (Effect)
import Effect.Console (log)
import Type.Proxy (Proxy(..))

foo = strokeFill $ staticString "red"
foo2 = strokeFill $ stringFromDatum (\d -> "red")

main :: Effect Unit
main = do
  log "🍝"
