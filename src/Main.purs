module Main where

import Attributes
import Prelude (Unit, ($))

import Effect (Effect)
import Effect.Console (log)

foo :: Attribute
foo = strokeFill $ staticString "red"
foo2 :: Attribute
foo2 = strokeFill $ stringFromDatum (\d -> "red")
bar :: Attribute
bar = strokeOpacity $ staticNumber 42.0
bar2 :: Attribute
bar2 = strokeOpacity $ numberFromDatum (\d -> 42.0)

main :: Effect Unit
main = do
  log "🍝"
