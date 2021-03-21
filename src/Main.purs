module Main where

import Attributes.Concrete
import Attributes.Variant
import Prelude (Unit, ($))

import Effect (Effect)
import Effect.Console (log)

attributesExample1 :: Array Attribute
attributesExample1 = [
    strokeFill    $ stringFromDatum (\d -> "red")
  , strokeOpacity $ staticNumber 42.0
]

attributesExample2 :: Array Attribute
attributesExample2 = [
    strokeFill    $ staticString "red"
  , strokeOpacity $ numberFromDatum (\d -> 42.0)
  , viewBox       $ staticArray [ 0.0, 0.0, 1000.0, 2000.0 ]
]



main :: Effect Unit
main = do
  log "🍝"
