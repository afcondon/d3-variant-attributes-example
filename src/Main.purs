module Main where

import Attributes
import Prelude

import Data.Variant (inj)
import Effect (Effect)
import Effect.Console (log)
import Type.Proxy (Proxy(..))

strokeOpacity :: NumberAttr -> Attribute
strokeOpacity n = Attr "stroke-opacity" $
  inj (Proxy :: Proxy "numberish") n

attrs :: Array Attribute
attrs = [ staticStringAttr, dynamicStringAttr, indexedStringAttr
        , staticNumberAttr, dynamicNumberAttr, indexedNumberAttr
        , staticArrayAttr, dynamicArrayAttr, indexedArrayAttr ]

foo = strokeOpacity staticNumber
bar = strokeOpacity dynamicNumber
baz = strokeOpacity indexedNumber

main :: Effect Unit
main = do
  log "🍝"
